#include "xparameters.h"
#include "xgpio.h"
#include "xil_printf.h"
#include "xstatus.h"
#include "sleep.h"
#include <limits.h>

/*
 * Your xparameters.h does not expose XPAR_<name>_DEVICE_ID macros,
 * so we keep the config-table indices explicit here.
 *
 * From your design:
 *   0 -> ADC_REG
 *   1 -> AMP_ENABLE_REG
 *   2 -> PHASE_REG
 */
#define ADC_GPIO_DEV_ID         0
#define AMP_GPIO_DEV_ID         1
#define PHASE_GPIO_DEV_ID       2

/* GPIO channels */
#define ADC_CH                  1
#define AMP_CH                  1
#define ENABLE_CH               2
#define PHASE_IN_CH             1
#define PHASE_OFFSET_CH         2

/* Masks / widths */
#define ADC_MASK                0xFFu

/* Test settings */
#define TEST_PHASE_IN           1000u
#define TEST_PHASE_OFFSET       200u
#define TEST_AMPLITUDE          50u
#define TEST_ENABLE             1u

/*
 * Sampling/report settings:
 *  - POLL_INTERVAL_US controls how fast you poll sample_out.
 *  - REPORT_EVERY_SAMPLES controls how often you print stats.
 *
 * Example below:
 *   1 kHz polling, print every 1000 samples => about once/second.
 */
#define POLL_INTERVAL_US        1000u
#define REPORT_EVERY_SAMPLES    1000u

/*
 * Set to 1 if you want to print only when the ADC/sample value changes.
 * Set to 0 to print min/max/avg summaries instead.
 */
#define PRINT_ON_CHANGE         0

static int InitGpio(XGpio *InstancePtr, u16 DevId, UINTPTR BaseAddr)
{
    XGpio_Config *Cfg;

    Cfg = XGpio_LookupConfig(DevId);
    if (Cfg == NULL) {
        return XST_FAILURE;
    }

    return XGpio_CfgInitialize(InstancePtr, Cfg, BaseAddr);
}

static void ProgramFra(XGpio *PhaseGpio, XGpio *AmpGpio,
                       u32 phase_in, u32 phase_offset,
                       u32 amplitude, u32 enable)
{
    XGpio_DiscreteWrite(PhaseGpio, PHASE_IN_CH, phase_in);
    XGpio_DiscreteWrite(PhaseGpio, PHASE_OFFSET_CH, phase_offset);
    XGpio_DiscreteWrite(AmpGpio, AMP_CH, amplitude);
    XGpio_DiscreteWrite(AmpGpio, ENABLE_CH, enable);
}

int main(void)
{
    int Status;
    XGpio GpioAdc;
    XGpio GpioAmpEnable;
    XGpio GpioPhase;

    u32 sample = 0;
    u32 last_sample = UINT_MAX;

    /* Stats for test reporting */
    u32 min_sample = ADC_MASK;
    u32 max_sample = 0;
    u32 sum_sample = 0;
    u32 count = 0;

    xil_printf("\r\n=== FRA GPIO test start ===\r\n");

    /* Initialize AXI GPIO instances */
    Status = InitGpio(&GpioAdc, ADC_GPIO_DEV_ID, XPAR_ADC_REG_BASEADDR);
    if (Status != XST_SUCCESS) {
        xil_printf("ERROR: ADC_REG init failed\r\n");
        return XST_FAILURE;
    }

    Status = InitGpio(&GpioAmpEnable, AMP_GPIO_DEV_ID, XPAR_AMP_ENABLE_REG_BASEADDR);
    if (Status != XST_SUCCESS) {
        xil_printf("ERROR: AMP_ENABLE_REG init failed\r\n");
        return XST_FAILURE;
    }

    Status = InitGpio(&GpioPhase, PHASE_GPIO_DEV_ID, XPAR_PHASE_REG_BASEADDR);
    if (Status != XST_SUCCESS) {
        xil_printf("ERROR: PHASE_REG init failed\r\n");
        return XST_FAILURE;
    }

    /* Configure GPIO directions */
    XGpio_SetDataDirection(&GpioAdc, ADC_CH, ADC_MASK);     /* 8-bit input */

    XGpio_SetDataDirection(&GpioAmpEnable, AMP_CH, 0x00u);      /* output */
    XGpio_SetDataDirection(&GpioAmpEnable, ENABLE_CH, 0x00u);   /* output */

    XGpio_SetDataDirection(&GpioPhase, PHASE_IN_CH, 0x00000000u);      /* output */
    XGpio_SetDataDirection(&GpioPhase, PHASE_OFFSET_CH, 0x00000000u);  /* output */

    /* Program test values */
    ProgramFra(&GpioPhase, &GpioAmpEnable,
               TEST_PHASE_IN,
               TEST_PHASE_OFFSET,
               TEST_AMPLITUDE,
               TEST_ENABLE);

    /* Read back programmed registers for sanity check */
    xil_printf("Configured:\r\n");
    xil_printf("  phase_in     = %lu\r\n", XGpio_DiscreteRead(&GpioPhase, PHASE_IN_CH));
    xil_printf("  phase_offset = %lu\r\n", XGpio_DiscreteRead(&GpioPhase, PHASE_OFFSET_CH));
    xil_printf("  amplitude    = %lu\r\n", XGpio_DiscreteRead(&GpioAmpEnable, AMP_CH));
    xil_printf("  enable       = %lu\r\n", XGpio_DiscreteRead(&GpioAmpEnable, ENABLE_CH));

#if PRINT_ON_CHANGE
    xil_printf("Mode: print on change\r\n");
#else
    xil_printf("Mode: %u us polling, report every %u samples\r\n",
               (unsigned)POLL_INTERVAL_US, (unsigned)REPORT_EVERY_SAMPLES);
#endif

    while (1) {
        /* sample_out[7:0] from fra_top_0 via ADC_REG */
        sample = XGpio_DiscreteRead(&GpioAdc, ADC_CH) & ADC_MASK;

#if PRINT_ON_CHANGE
        if (sample != last_sample) {
            xil_printf("sample_out = %lu\r\n", sample);
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
                       sample,
                       min_sample,
                       max_sample,
                       sum_sample / REPORT_EVERY_SAMPLES);

            min_sample = ADC_MASK;
            max_sample = 0;
            sum_sample = 0;
            count = 0;
        }
#endif

        usleep(POLL_INTERVAL_US);
    }

    /* not reached */
    /* return XST_SUCCESS; */
}