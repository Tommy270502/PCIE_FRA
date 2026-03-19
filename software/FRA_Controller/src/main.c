#include "xparameters.h"
#include "xgpio.h"
#include "xil_printf.h"
#include "xstatus.h"
#include "sleep.h"

#include <limits.h>
#include <stdint.h>
#include <math.h>

/* ---------------- DDS / hardware configuration ---------------- */

#define DDS_CLK_HZ              25000000.0
#define DDS_PHASE_SCALE         4294967296.0   /* 2^32 */
#define ADC_MASK                0xFFu

/* GPIO channels */
#define ADC_CH                  1
#define AMP_CH                  1
#define ENABLE_CH               2
#define PHASE_IN_CH             1
#define PHASE_OFFSET_CH         2

/* ---------------- Startup settings ---------------- */

#define TEST_FREQ_HZ            1000.0
#define TEST_PHASE_OFFSET       0u
#define TEST_AMPLITUDE          128u
#define TEST_ENABLE             1u

/* ---------------- Runtime options ---------------- */

/* 0 = monitor ADC continuously, 1 = run log sweep continuously */
#define RUN_SWEEP               1

/* ADC monitor settings */
#define POLL_INTERVAL_US        1000u
#define REPORT_EVERY_SAMPLES    1000u
#define PRINT_ON_CHANGE         0

/* Sweep settings */
#define SWEEP_FSTART_HZ         10.0
#define SWEEP_FSTOP_HZ          20000.0
#define SWEEP_POINTS            20u
#define SWEEP_DWELL_US          100000u

/* ---------------- Utility functions ---------------- */

static int InitGpio(XGpio *InstancePtr, UINTPTR BaseAddr)
{
    return XGpio_Initialize(InstancePtr, BaseAddr);
}

static u32 DdsPhaseIncFromFreq(double freq_hz)
{
    if (freq_hz <= 0.0) {
        return 0u;
    }

    if (freq_hz > (DDS_CLK_HZ / 2.0)) {
        freq_hz = DDS_CLK_HZ / 2.0;
    }

    return (u32)((freq_hz * DDS_PHASE_SCALE) / DDS_CLK_HZ + 0.5);
}

static double DdsFreqFromPhaseInc(u32 phase_inc)
{
    return ((double)phase_inc * DDS_CLK_HZ) / DDS_PHASE_SCALE;
}

static void SetFrequencyHz(XGpio *PhaseGpio, double freq_hz)
{
    XGpio_DiscreteWrite(PhaseGpio, PHASE_IN_CH, DdsPhaseIncFromFreq(freq_hz));
}

static void ProgramFra(XGpio *PhaseGpio,
                       XGpio *AmpGpio,
                       u32 phase_in,
                       u32 phase_offset,
                       u32 amplitude,
                       u32 enable)
{
    XGpio_DiscreteWrite(PhaseGpio, PHASE_IN_CH, phase_in);
    XGpio_DiscreteWrite(PhaseGpio, PHASE_OFFSET_CH, phase_offset);
    XGpio_DiscreteWrite(AmpGpio, AMP_CH, amplitude);
    XGpio_DiscreteWrite(AmpGpio, ENABLE_CH, enable);
}

static void SweepLog(XGpio *PhaseGpio,
                     double fstart_hz,
                     double fstop_hz,
                     u32 points,
                     u32 dwell_us)
{
    u32 i;
    double ratio;
    double f;

    if ((points < 2u) || (fstart_hz <= 0.0) || (fstop_hz <= 0.0)) {
        xil_printf("SweepLog: invalid arguments\r\n");
        return;
    }

    ratio = pow(fstop_hz / fstart_hz, 1.0 / (double)(points - 1u));
    f = fstart_hz;

    for (i = 0; i < points; i++) {
        u32 phase_inc = DdsPhaseIncFromFreq(f);

        XGpio_DiscreteWrite(PhaseGpio, PHASE_IN_CH, phase_inc);

        xil_printf("sweep[%lu/%lu]: f=%lu Hz, phase_inc=%lu\r\n",
                   (unsigned long)(i + 1u),
                   (unsigned long)points,
                   (unsigned long)(f + 0.5),
                   (unsigned long)phase_inc);

        usleep(dwell_us);
        f *= ratio;
    }
}

static int InitFraGpio(XGpio *GpioAdc, XGpio *GpioAmpEnable, XGpio *GpioPhase)
{
    int Status;

    Status = InitGpio(GpioAdc, XPAR_ADC_REG_BASEADDR);
    if (Status != XST_SUCCESS) {
        xil_printf("ERROR: ADC_REG init failed (status=%d)\r\n", Status);
        return XST_FAILURE;
    }

    Status = InitGpio(GpioAmpEnable, XPAR_AMP_ENABLE_REG_BASEADDR);
    if (Status != XST_SUCCESS) {
        xil_printf("ERROR: AMP_ENABLE_REG init failed (status=%d)\r\n", Status);
        return XST_FAILURE;
    }

    Status = InitGpio(GpioPhase, XPAR_PHASE_REG_BASEADDR);
    if (Status != XST_SUCCESS) {
        xil_printf("ERROR: PHASE_REG init failed (status=%d)\r\n", Status);
        return XST_FAILURE;
    }

    XGpio_SetDataDirection(GpioAdc, ADC_CH, ADC_MASK);             /* input */
    XGpio_SetDataDirection(GpioAmpEnable, AMP_CH, 0x00000000u);    /* output */
    XGpio_SetDataDirection(GpioAmpEnable, ENABLE_CH, 0x00000000u); /* output */
    XGpio_SetDataDirection(GpioPhase, PHASE_IN_CH, 0x00000000u);   /* output */
    XGpio_SetDataDirection(GpioPhase, PHASE_OFFSET_CH, 0x00000000u); /* output */

    return XST_SUCCESS;
}

static void PrintConfig(XGpio *GpioPhase, XGpio *GpioAmpEnable)
{
    u32 phase_in = XGpio_DiscreteRead(GpioPhase, PHASE_IN_CH);
    u32 phase_offset = XGpio_DiscreteRead(GpioPhase, PHASE_OFFSET_CH);
    u32 amplitude = XGpio_DiscreteRead(GpioAmpEnable, AMP_CH);
    u32 enable = XGpio_DiscreteRead(GpioAmpEnable, ENABLE_CH);

    xil_printf("Configured:\r\n");
    xil_printf("  phase_in     = %lu\r\n", (unsigned long)phase_in);
    xil_printf("  phase_freq   = %lu Hz\r\n", (unsigned long)(DdsFreqFromPhaseInc(phase_in) + 0.5));
    xil_printf("  phase_offset = %lu\r\n", (unsigned long)phase_offset);
    xil_printf("  amplitude    = %lu\r\n", (unsigned long)amplitude);
    xil_printf("  enable       = %lu\r\n", (unsigned long)enable);
}

/* ---------------- Main ---------------- */

int main(void)
{
    int Status;
    XGpio GpioAdc;
    XGpio GpioAmpEnable;
    XGpio GpioPhase;

#if !PRINT_ON_CHANGE
    u32 min_sample = ADC_MASK;
    u32 max_sample = 0u;
    u32 sum_sample = 0u;
    u32 count = 0u;
#else
    u32 last_sample = UINT_MAX;
#endif

    xil_printf("\r\n=== FRA GPIO test start ===\r\n");

    xil_printf("Base addresses:\r\n");
    xil_printf("  ADC_REG        = 0x%08lx\r\n", (unsigned long)XPAR_ADC_REG_BASEADDR);
    xil_printf("  AMP_ENABLE_REG = 0x%08lx\r\n", (unsigned long)XPAR_AMP_ENABLE_REG_BASEADDR);
    xil_printf("  PHASE_REG      = 0x%08lx\r\n", (unsigned long)XPAR_PHASE_REG_BASEADDR);

    Status = InitFraGpio(&GpioAdc, &GpioAmpEnable, &GpioPhase);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    ProgramFra(&GpioPhase,
               &GpioAmpEnable,
               DdsPhaseIncFromFreq(TEST_FREQ_HZ),
               TEST_PHASE_OFFSET,
               TEST_AMPLITUDE,
               TEST_ENABLE);

    PrintConfig(&GpioPhase, &GpioAmpEnable);

#if RUN_SWEEP
    xil_printf("Mode: log sweep from %lu Hz to %lu Hz, %lu points, dwell %lu us\r\n",
               (unsigned long)(SWEEP_FSTART_HZ + 0.5),
               (unsigned long)(SWEEP_FSTOP_HZ + 0.5),
               (unsigned long)SWEEP_POINTS,
               (unsigned long)SWEEP_DWELL_US);

    while (1) {
        SweepLog(&GpioPhase,
                 SWEEP_FSTART_HZ,
                 SWEEP_FSTOP_HZ,
                 SWEEP_POINTS,
                 SWEEP_DWELL_US);
    }
#else
#if PRINT_ON_CHANGE
    xil_printf("Mode: print ADC on change\r\n");
#else
    xil_printf("Mode: %u us polling, report every %u samples\r\n",
               (unsigned)POLL_INTERVAL_US,
               (unsigned)REPORT_EVERY_SAMPLES);
#endif

    while (1) {
        u32 sample = XGpio_DiscreteRead(&GpioAdc, ADC_CH) & ADC_MASK;

#if PRINT_ON_CHANGE
        if (sample != last_sample) {
            xil_printf("sample_out = %lu\r\n", (unsigned long)sample);
            last_sample = sample;
        }
#else
        if (sample < min_sample) {
            min_sample = sample;
        }

        if (sample > max_sample) {
            max_sample = sample;
        }

        sum_sample += sample;
        count++;

        if (count >= REPORT_EVERY_SAMPLES) {
            xil_printf("sample_out: last=%lu min=%lu max=%lu avg=%lu\r\n",
                       (unsigned long)sample,
                       (unsigned long)min_sample,
                       (unsigned long)max_sample,
                       (unsigned long)(sum_sample / REPORT_EVERY_SAMPLES));

            min_sample = ADC_MASK;
            max_sample = 0u;
            sum_sample = 0u;
            count = 0u;
        }
#endif

        usleep(POLL_INTERVAL_US);
    }
#endif
}