#include "xparameters.h"
#include "xil_printf.h"
#include "sleep.h"
#include "xil_io.h"
#include <stdint.h>

/*
 * AXI GPIO register offsets
 * Channel 1:
 *   DATA = 0x0
 *   TRI  = 0x4
 *
 * Channel 2:
 *   DATA = 0x8
 *   TRI  = 0xC
 */

#define GPIO_DATA_OFFSET   0x0
#define GPIO_TRI_OFFSET    0x4

#define ADC_GPIO_BASE      XPAR_AXI_GPIO_0_BASEADDR
#define DAC_GPIO_BASE      XPAR_AXI_GPIO_1_BASEADDR

static inline void gpio_set_direction(uint32_t base, uint32_t tri_mask)
{
    Xil_Out32(base + GPIO_TRI_OFFSET, tri_mask);
}

static inline uint32_t gpio_read(uint32_t base)
{
    return Xil_In32(base + GPIO_DATA_OFFSET);
}

static inline void gpio_write(uint32_t base, uint32_t value)
{
    Xil_Out32(base + GPIO_DATA_OFFSET, value);
}

int main(void)
{
    uint32_t adc_val;
    uint32_t dac_val;

    xil_printf("ADC/DAC GPIO test start\r\n");

    /*
     * AXI GPIO TRI register:
     *   1 = input
     *   0 = output
     */

    /* ADC on GPIO_0, use low 8 bits as input */
    gpio_set_direction(ADC_GPIO_BASE, 0x000000FF);

    /* DAC on GPIO_1, 8 bits as output */
    gpio_set_direction(DAC_GPIO_BASE, 0x00000000);

    while (1) {
        /* Read ADC byte from low 8 bits */
        adc_val = gpio_read(ADC_GPIO_BASE) & 0xFF;

        /* Mirror ADC directly to DAC */
        dac_val = adc_val & 0xFF;
        gpio_write(DAC_GPIO_BASE, dac_val);

        xil_printf("ADC = 0x%02X, DAC = 0x%02X\r\n",
                   (unsigned int)adc_val,
                   (unsigned int)dac_val);

        usleep(100000);
    }

    return 0;
}