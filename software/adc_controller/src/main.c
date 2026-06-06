#include "xparameters.h"
#include "xgpio.h"
#include "xil_printf.h"
#include "xstatus.h"
#include "sleep.h"

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

/* ---------------- DAC settings ---------------- */

#define TEST_PHASE_OFFSET       0u
#define TEST_AMPLITUDE          128u
#define TEST_ENABLE             1u

/* ---------------- Sweep settings ---------------- */

/* number of frequency points in the log sweep */
#define SWEEP_FSTART_HZ         10.0
#define SWEEP_FSTOP_HZ          20000.0
#define SWEEP_POINTS            100u

/* short settling time after changing DAC frequency */
#define SETTLE_US               200u

/* ADC reads per frequency step */
#define ADC_SAMPLES_PER_STEP    1024u

/* 0 = sample as fast as possible, >0 = throttle sampling */
#define ADC_SAMPLE_DELAY_US     0u

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

    XGpio_SetDataDirection(GpioAdc, ADC_CH, ADC_MASK);
    XGpio_SetDataDirection(GpioAmpEnable, AMP_CH, 0x00000000u);
    XGpio_SetDataDirection(GpioAmpEnable, ENABLE_CH, 0x00000000u);
    XGpio_SetDataDirection(GpioPhase, PHASE_IN_CH, 0x00000000u);
    XGpio_SetDataDirection(GpioPhase, PHASE_OFFSET_CH, 0x00000000u);

    return XST_SUCCESS;
}

static void PrintConfig(XGpio *GpioPhase, XGpio *GpioAmpEnable)
{
    u32 phase_in = XGpio_DiscreteRead(GpioPhase, PHASE_IN_CH);
    u32 phase_offset = XGpio_DiscreteRead(GpioPhase, PHASE_OFFSET_CH);
    u32 amplitude = XGpio_DiscreteRead(GpioAmpEnable, AMP_CH);
    u32 enable = XGpio_DiscreteRead(GpioAmpEnable, ENABLE_CH);

    xil_printf("Configured:\r\n");
    xil_printf("  phase_in     = %u\r\n", (unsigned int)phase_in);
    xil_printf("  phase_freq   = %u Hz\r\n", (unsigned int)(DdsFreqFromPhaseInc(phase_in) + 0.5));
    xil_printf("  phase_offset = %u\r\n", (unsigned int)phase_offset);
    xil_printf("  amplitude    = %u\r\n", (unsigned int)amplitude);
    xil_printf("  enable       = %u\r\n", (unsigned int)enable);
}

static int SweepLogAdcOnce(XGpio *GpioAdc,
                           XGpio *GpioPhase,
                           double fstart_hz,
                           double fstop_hz,
                           u32 points,
                           u32 settle_us,
                           u32 adc_samples_per_step,
                           u32 adc_sample_delay_us,
                           u32 *freq_store,
                           u32 *phase_store,
                           u32 *adc_last_store,
                           u32 *adc_min_store,
                           u32 *adc_max_store,
                           u32 *adc_avg_store)
{
    u32 i;
    double ratio;
    double f;

    if ((points < 2u) || (fstart_hz <= 0.0) || (fstop_hz <= 0.0)) {
        xil_printf("SweepLogAdcOnce: invalid arguments\r\n");
        return XST_FAILURE;
    }

    if (adc_samples_per_step == 0u) {
        xil_printf("SweepLogAdcOnce: adc_samples_per_step must be > 0\r\n");
        return XST_FAILURE;
    }

    ratio = pow(fstop_hz / fstart_hz, 1.0 / (double)(points - 1u));
    f = fstart_hz;

    for (i = 0; i < points; i++) {
        u32 j;
        u32 phase_inc = DdsPhaseIncFromFreq(f);
        u32 sample = 0u;
        u32 min_sample = ADC_MASK;
        u32 max_sample = 0u;
        u32 sum_sample = 0u;

        XGpio_DiscreteWrite(GpioPhase, PHASE_IN_CH, phase_inc);

        if (settle_us > 0u) {
            usleep(settle_us);
        }

        for (j = 0; j < adc_samples_per_step; j++) {
            sample = XGpio_DiscreteRead(GpioAdc, ADC_CH) & ADC_MASK;

            if (sample < min_sample) {
                min_sample = sample;
            }

            if (sample > max_sample) {
                max_sample = sample;
            }

            sum_sample += sample;

            if (adc_sample_delay_us > 0u) {
                usleep(adc_sample_delay_us);
            }
        }

        freq_store[i]     = (u32)(f + 0.5);
        phase_store[i]    = phase_inc;
        adc_last_store[i] = sample;
        adc_min_store[i]  = min_sample;
        adc_max_store[i]  = max_sample;
        adc_avg_store[i]  = sum_sample / adc_samples_per_step;

        f *= ratio;
    }

    return XST_SUCCESS;
}

/* ---------------- Main ---------------- */

int main(void)
{
    int Status;
    XGpio GpioAdc;
    XGpio GpioAmpEnable;
    XGpio GpioPhase;
    u32 i;

    u32 freq_store[SWEEP_POINTS];
    u32 phase_store[SWEEP_POINTS];
    u32 adc_last_store[SWEEP_POINTS];
    u32 adc_min_store[SWEEP_POINTS];
    u32 adc_max_store[SWEEP_POINTS];
    u32 adc_avg_store[SWEEP_POINTS];

    xil_printf("\r\n=== One-shot log sweep + dense ADC sampling ===\r\n");

    Status = InitFraGpio(&GpioAdc, &GpioAmpEnable, &GpioPhase);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    ProgramFra(&GpioPhase,
               &GpioAmpEnable,
               DdsPhaseIncFromFreq(SWEEP_FSTART_HZ),
               TEST_PHASE_OFFSET,
               TEST_AMPLITUDE,
               TEST_ENABLE);

    PrintConfig(&GpioPhase, &GpioAmpEnable);

    xil_printf("Sweep: %u -> %u Hz, %u freq points\r\n",
               (unsigned int)(SWEEP_FSTART_HZ + 0.5),
               (unsigned int)(SWEEP_FSTOP_HZ + 0.5),
               (unsigned int)SWEEP_POINTS);

    xil_printf("ADC: %u samples/step, settle=%u us, sample_delay=%u us\r\n",
               (unsigned int)ADC_SAMPLES_PER_STEP,
               (unsigned int)SETTLE_US,
               (unsigned int)ADC_SAMPLE_DELAY_US);

    Status = SweepLogAdcOnce(&GpioAdc,
                             &GpioPhase,
                             SWEEP_FSTART_HZ,
                             SWEEP_FSTOP_HZ,
                             SWEEP_POINTS,
                             SETTLE_US,
                             ADC_SAMPLES_PER_STEP,
                             ADC_SAMPLE_DELAY_US,
                             freq_store,
                             phase_store,
                             adc_last_store,
                             adc_min_store,
                             adc_max_store,
                             adc_avg_store);

    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    xil_printf("\r\nSweep complete.\r\n");
    xil_printf("idx\tfreq_hz\tphase_inc\tadc_last\tadc_min\tadc_max\tadc_avg\r\n");

    for (i = 0; i < SWEEP_POINTS; i++) {
        xil_printf("%u\t%u\t%u\t%u\t%u\t%u\t%u\r\n",
                   (unsigned int)i,
                   (unsigned int)freq_store[i],
                   (unsigned int)phase_store[i],
                   (unsigned int)adc_last_store[i],
                   (unsigned int)adc_min_store[i],
                   (unsigned int)adc_max_store[i],
                   (unsigned int)adc_avg_store[i]);
    }

    xil_printf("\r\nDone.\r\n");

    while (1) {
        usleep(1000000u);
    }
}