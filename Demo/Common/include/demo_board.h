
  
#ifndef _DEMOBOARD_BOARD_H_
#define _DEMOBOARD_BOARD_H_




/* The LED colours. */
typedef enum {
    DEMOBOARD_RED_LED,	
    DEMOBOARD_GREEN_LED,
    DEMOBOARD_BLUE_LED    
}DEMOBOARD_LEDS_t;


void DemoBoardLedInitialise( void );
void DemoBoardSetLED( DEMOBOARD_LEDS_t led  );
void DemoBoardClearLED( DEMOBOARD_LEDS_t led  );
void DemoBoardToggleLED( DEMOBOARD_LEDS_t led  );

#endif

