/* 
 * "Small Hello World" example. 
 * 
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example 
 * designs. It requires a STDOUT  device in your system's hardware. 
 *
 * The purpose of this example is to demonstrate the smallest possible Hello 
 * World application, using the Nios II HAL library.  The memory footprint
 * of this hosted application is ~332 bytes by default using the standard 
 * reference design.  For a more fully featured Hello World application
 * example, see the example titled "Hello World".
 *
 * The memory footprint of this example has been reduced by making the
 * following changes to the normal "Hello World" example.
 * Check in the Nios II Software Developers Manual for a more complete 
 * description.
 * 
 * In the SW Application project (small_hello_world):
 *
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 * In System Library project (small_hello_world_syslib):
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 *    - Define the preprocessor option ALT_NO_INSTRUCTION_EMULATION 
 *      This removes software exception handling, which means that you cannot 
 *      run code compiled for Nios II cpu with a hardware multiplier on a core 
 *      without a the multiply unit. Check the Nios II Software Developers 
 *      Manual for more details.
 *
 *  - In the System Library page:
 *    - Set Periodic system timer and Timestamp timer to none
 *      This prevents the automatic inclusion of the timer driver.
 *
 *    - Set Max file descriptors to 4
 *      This reduces the size of the file handle pool.
 *
 *    - Check Main function does not exit
 *    - Uncheck Clean exit (flush buffers)
 *      This removes the unneeded call to exit when main returns, since it
 *      won't.
 *
 *    - Check Don't use C++
 *      This builds without the C++ support code.
 *
 *    - Check Small C library
 *      This uses a reduced functionality C library, which lacks  
 *      support for buffering, file IO, floating point and getch(), etc. 
 *      Check the Nios II Software Developers Manual for a complete list.
 *
 *    - Check Reduced device drivers
 *      This uses reduced functionality drivers if they're available. For the
 *      standard design this means you get polled UART and JTAG UART drivers,
 *      no support for the LCD driver and you lose the ability to program 
 *      CFI compliant flash devices.
 *
 *    - Check Access device drivers directly
 *      This bypasses the device file system to access device drivers directly.
 *      This eliminates the space required for the device file system services.
 *      It also provides a HAL version of libc services that access the drivers
 *      directly, further reducing space. Only a limited number of libc
 *      functions are available in this configuration.
 *
 *    - Use ALT versions of stdio routines:
 *
 *           Function                  Description
 *        ===============  =====================================
 *        alt_printf       Only supports %s, %x, and %c ( < 1 Kbyte)
 *        alt_putstr       Smaller overhead than puts with direct drivers
 *                         Note this function doesn't add a newline.
 *        alt_putchar      Smaller overhead than putchar with direct drivers
 *        alt_getchar      Smaller overhead than getchar with direct drivers
 *
 */
#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_uart_regs.h"


# include <unistd.h>
# include <fcntl.h>
# include "sys/alt_stdio.h"

#define TIME_STD 10000000
void delay(int a){

	volatile int i = 0;

	while (i<a*TIME_STD)i++;

}
//blink led

void ledDemo(){

	int b;
	int led_on = 0;

	b = IORD_ALTERA_AVALON_UART_RXDATA(RS232_BASE);

	if ((b&0x60)&&0x6) {
		IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, 0x00);
		IOWR_ALTERA_AVALON_PIO_DATA(WRITEDATA_BASE, 0x00);
	}
	else {
		IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE,0xff);
		IOWR_ALTERA_AVALON_PIO_DATA(WRITEDATA_BASE,0xff);
	}

	led_on ^= (1<<(b-1));
	//IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE,"11111111");
	printf("led position %d\n",b);

}

int write_routine(){
	alt_printf("Write Routine\n");



 return 1;
}

int read_routine(){

	alt_printf("Read Routine\n");
	delay(1);

	int b = IORD_ALTERA_AVALON_PIO_DATA(READDATA_BASE);
	alt_printf("----Read Value: %x\n", b);
	IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, b);

return 1;
}
int main(){

	int command = 0x00;
	int operation_complete = 0;

	while(1){

		alt_printf("Digite a primeira palavra no formato 0xFF\n");

		while(IORD_ALTERA_AVALON_UART_RXDATA(RS232_BASE)!=0xFF){
			delay(1);
		}

		alt_printf("Envio de comandos iniciado\n");

		while(operation_complete==0){

			command = IORD_ALTERA_AVALON_UART_RXDATA(RS232_BASE);

			if((command&0xFF)==0xFF){

				alt_printf("Digite um comando valido\n");

			}
			else if(command==0x00) { //leitura

				IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE,0xff);

				alt_printf("Comando de Leitura\n");

				//Pega o valor em ReadData e imprime aqui na tela
				//Ativa os pinos pra pegar valor de leitura


				operation_complete = read_routine();

			} else if (command >= 0x80) { //Primeiro bit sendo 1, o resto não importa pra ser escrita
				alt_printf("Comando de Escrita\n");

				//Ativa os pinos pra escrever o valor

				operation_complete = write_routine();

			} else {

				alt_printf("Nenhum dos dois\n");
			}

			delay(2);

		}
		operation_complete = 0;
	}

return 0;
}

