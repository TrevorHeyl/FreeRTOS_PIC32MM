
/* Scheduler includes. */
#include "FreeRTOS.h"

/* Demo app includes. */
#include "demo_board.h"



#define ptOUTPUT 	0
#define ptALL_OFF	0xffff
#define mainCHECK_LED 10

/*-----------------------------------------------------------
 * Simple parallel port IO routines.
 * DemoBoard LEDS are active low:
 * Blue : RC3
 * Red  : RD3
 * Green : RD0
 *  *-----------------------------------------------------------*/



void DemoBoardLedInitialise( void )
{
		
    //ANSELA=0;ANSELB=0;ANSELC=0;ANSELD=0;
    //AD1PCFG = 0xffff;
	TRISD = 0xFFF6;  // 0 is output	
    TRISC = 0x7FF7;
	PORTD = ptALL_OFF;
	PORTC = ptALL_OFF;
    //LATCSET = 0xFFFE;
    //CNPUC = 0x0020;
}
/*-----------------------------------------------------------*/


void DemoBoardClearLED( DEMOBOARD_LEDS_t led  ) {
    
    switch (led) {
        case DEMOBOARD_RED_LED :
                LATDSET = 0xFFFE;
            break;
        case DEMOBOARD_GREEN_LED :
                LATDSET = 0xFFF7;
            break;
        case DEMOBOARD_BLUE_LED :
                LATCSET = 0xFFFE;
            break;
    }
    
}

void DemoBoardEnableTamper( void  ) {
    PORTCbits.RC15 = 1;          
}

int DemoBoardReadTamper( void) {
    
    int ret = -1;
    
    ret = PORTC;
    
    return ret;
    
}

void DemoBoardSetLED( DEMOBOARD_LEDS_t led  ) {
    
    switch (led) {
        case DEMOBOARD_RED_LED :
                LATDCLR = 0xFFFE;
            break;
        case DEMOBOARD_GREEN_LED :
                LATDCLR = 0xFFF7;
            break;
        case DEMOBOARD_BLUE_LED :
                LATCCLR = 0xFFFE;
            break;
    }
    
}



/*-----------------------------------------------------------*/

void DemoBoardToggleLED( DEMOBOARD_LEDS_t led )
{

    switch (led) {
        case DEMOBOARD_RED_LED :
                LATDINV = 0xFFFE;
            break;
        case DEMOBOARD_GREEN_LED :
                LATDINV = 0xFFF7;
            break;
        case DEMOBOARD_BLUE_LED :
                LATCINV = 0xFFFE;
            break;
    }
}



