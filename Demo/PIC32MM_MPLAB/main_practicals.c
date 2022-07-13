/* Standard includes. */
#include <stdio.h>

/* Kernel includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
#include "semphr.h"

/* Standard demo includes. */
#include "demo_board.h"


/* Priorities at which the tasks are created. */
#define mainQUEUE_RECEIVE_TASK_PRIORITY		( tskIDLE_PRIORITY + 2 )
#define	mainQUEUE_SEND_TASK_PRIORITY		( tskIDLE_PRIORITY + 1 )

#define TASK_LOW_PRIORITY		( tskIDLE_PRIORITY + 1 )

/* specific configs */
#define MINIMAL_TASK_STACK_SIZE           200


/* The rate at which data is sent to the queue.  The 200ms value is converted
to ticks using the portTICK_PERIOD_MS constant. */
#define mainQUEUE_SEND_FREQUENCY_MS			( 200 / portTICK_PERIOD_MS )

/* The number of items the queue can hold.  This is 1 as the receive task
will remove items as they are added, meaning the send task should always find
the queue empty. */
#define mainQUEUE_LENGTH					( 10 )

/* Values passed to the two tasks just to check the task parameter
functionality. */
#define mainQUEUE_SEND_PARAMETER			( 0x1111UL )
#define mainQUEUE_RECEIVE_PARAMETER			( 0x22UL )

/* The period of the blinky software timer.  The period is specified in ms and
converted to ticks using the portTICK_PERIOD_MS constant. */
#define mainBLINKY_TIMER_PERIOD				( 50 / portTICK_PERIOD_MS )


/* Misc. */
#define mainDONT_BLOCK						( 0 )

/*-----------------------------------------------------------*/

#define MINIMAL_TASK_STACK_SIZE 200


/*
 * The tasks as described in the comments at the top of this file.
 */
void pTaskFlashRed_2Hz( void *pvParameters );
void pTaskFlashBlue_0_5Hz( void *pvParameters );
void pTaskCheckTamper( void *pvParameters );
void pFToggleGreenLED( TimerHandle_t xTimer );
void pTaskLedHandler( void *pvParameters );
void pTaskLedPoster( void *pvParameters );
void pTaskFlasher( void *pvParameters );
void pTaskFlashControl( void *pvParameters );
void pTaskFlashBlue_Mutexed( void *pvParameters );
void pTaskFlashRed_Mutexed( void *pvParameters );






static void prvQueueReceiveTask( void *pvParameters );
static void prvQueueSendTask( void *pvParameters );

/*
 * The callback function for the blinky software timer, as described at the top
 * of this file.
 */
static void prvBlinkyTimerCallback( TimerHandle_t xTimer );

/*
 * Called by main() to create the simply blinky style application if
 * mainCREATE_SIMPLE_BLINKY_DEMO_ONLY is set to 1.
 */
void main_blinky( void );
void main_example_simple_task (void );
void main_example_two_tasks (void);
void main_queue_example (void);
void main_example_semaphore (void);
void main_example_mutex(void);
void main_example_mutex_extended(void);


/**
 * PRAC1_EXAMPLE_SIMPLE_TASK
 * Simple task, only one task running, flashing a BLUE LED at 0.5Hz
 */
void main_example_simple_task (void ){
    
    DemoBoardLedInitialise();
    
    xTaskCreate( pTaskFlashBlue_0_5Hz,                           /* The function that implements the task. */
		"Blue LED task", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
		MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
		( void * ) NULL,                        /* The parameter passed to the task  */
		TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
		NULL  );									/* . */

	/* Start the task */
	vTaskStartScheduler();
	
}

void pTaskFlashBlue_0_5Hz( void *pvParameters )
{  
	for( ;; )
	{
        DemoBoardToggleLED( DEMOBOARD_BLUE_LED );
        vTaskDelay(2000);           
	}
}

void pTaskFlashRed_2Hz( void *pvParameters )
{
	for( ;; )
	{
			DemoBoardToggleLED( DEMOBOARD_RED_LED );
            vTaskDelay(250);           
	}
}

/**
 * PRAC2_EXAMPLE_TWO_TASKS
 * Simple tasks, each flashing a different  LED at a different rate
 */
void main_example_two_tasks (void ){
		
        DemoBoardLedInitialise();
    
        xTaskCreate( pTaskFlashBlue_0_5Hz,                           /* The function that implements the task. */
					"Blue LED task", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
					MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
					( void * ) NULL,                        /* The parameter passed to the task  */
					TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
					NULL );									/* The task handle is not required, so NULL is passed. */
        xTaskCreate( pTaskFlashRed_2Hz,                           /* The function that implements the task. */
					"Red LED task", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
					MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
					( void * ) NULL,                        /* The parameter passed to the task  */
					TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
					NULL );									/* The task handle is not required, so NULL is passed. */

		/* Start the tasks . */
		vTaskStartScheduler();
	
}

void main_example_interrupt(void) {
    
    DemoBoardEnableTamper();
    xTaskCreate( pTaskCheckTamper,                           /* The function that implements the task. */
					"Simple", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
					MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
					( void * ) NULL,                        /* The parameter passed to the task  */
					TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
					NULL );									/* The task handle is not required, so NULL is passed. */

    /* Start the tasks . */
	vTaskStartScheduler();
    
}

/* We create the Task TCB and stack in global scope - we could create inside a function but then it goes onto the C-stack*/
StaticTask_t xTaskBlueBuffer;
StackType_t  xStackBlue[MINIMAL_TASK_STACK_SIZE];

/**
 * PRAC3_EXAMPLE_STATIC_TASK
 * Simple task, only one task running, flashing an LED at 0.5Hz
 * Task uses static memory stack. If only static stack tasks are created then we can define the heap size to 0
 * This is useful if dynamic memory allocation is not required or wanted 
 */
void main_example_static_task (void ){
    
    xTaskCreateStatic( pTaskFlashBlue_0_5Hz,                           /* The function that implements the task. */
		"Blue LED task", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
		MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
		( void * ) NULL,                        /* The parameter passed to the task  */
		TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
		 xStackBlue ,&xTaskBlueBuffer  );		/* Task control block and stack memory */

		/* Start the task */
	vTaskStartScheduler();
	
}


/**
 * PRAC4_EXAMPLE_TIMER
 * We create a task to flash the blue LED at 0.5Hz and we create a timer which has a callback to flash the GREEN led at a different rate
 */
void main_timer_example(void) {

    TimerHandle_t aTimer; // we can create it here, in local scope

    DemoBoardLedInitialise();
    
    xTaskCreate( pTaskFlashBlue_0_5Hz,                           /* The function that implements the task. */
		"Blue LED task", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
		MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
		( void * ) NULL,                        /* The parameter passed to the task  */
		TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
		NULL  );									/* . */
	aTimer = xTimerCreate( 	"Blinky",					/* A text name, purely to help debugging. */
		( 200 ),/* The timer period. */
		pdTRUE,						/* This is an auto-reload timer, so xAutoReload is set to pdTRUE. */
		( void * ) 0,				/* The ID is not used, so can be set to anything. */
		pFToggleGreenLED		/* The callback function that inspects the status of all the other tasks. */
		);

		if( aTimer != NULL )
		{
			xTimerStart( aTimer, 0 ); /* start the timer with no blocking (starting delay), ignored till OS starts anyway */
		}

	/* Start the task */
	vTaskStartScheduler();
   
}


/*-----------------------------------------------------------*/

/* The queue used by tasks. */
static QueueHandle_t xLedQueue = NULL;

/*-----------------------------------------------------------*/

/**
 * PRAC6_EXAMPLE_QUEUE
 * We create 2 tasks. One is a producer and one a consumer of queued messages
 */
void main_queue_example (void ){
		
        DemoBoardLedInitialise();
        
        	/* Create the queue. */
        xLedQueue = xQueueCreate( mainQUEUE_LENGTH, sizeof( unsigned long ) );

        if( xLedQueue == NULL ) {
            return;
        }

    
        xTaskCreate( pTaskLedHandler,                           /* The function that implements the task. */
					"Led Handler", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
					MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
					( void * ) NULL,                        /* The parameter passed to the task  */
					TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
					NULL );									/* The task handle is not required, so NULL is passed. */
        xTaskCreate( pTaskLedPoster,                           /* The function that implements the task. */
					"Led Poster", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
					MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
					( void * ) NULL,                        /* The parameter passed to the task  */
					TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
					NULL );									/* The task handle is not required, so NULL is passed. */

		/* Start the tasks . */
		vTaskStartScheduler();
	
}

SemaphoreHandle_t xLedFlashToggleSemaPhore; 

/**
 * PRAC7_EXAMPLE_SEMAPHORE
 * Demonstrating the use of a binary semaphore
 */
void main_example_semaphore (void ){
		
        DemoBoardLedInitialise();
    
        xLedFlashToggleSemaPhore = xSemaphoreCreateBinary();

        if ( (xLedFlashToggleSemaPhore == NULL) ) {
            return;
        }
        
        xTaskCreate( pTaskFlasher,                           /* The function that implements the task. */
					"Flasher", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
					MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
					( void * ) NULL,                        /* The parameter passed to the task  */
					TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
					NULL );									/* The task handle is not required, so NULL is passed. */
        xTaskCreate( pTaskFlashControl,                           /* The function that implements the task. */
					"Control", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
					MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
					( void * ) NULL,                        /* The parameter passed to the task  */
					TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
					NULL );									/* The task handle is not required, so NULL is passed. */

		/* Start the tasks . */
		vTaskStartScheduler();
	
}

SemaphoreHandle_t LEDMutex;

/**
 * PRAC8_EXAMPLE_MUTEX
 * Demonstrating the use of a mutex
 */
void main_example_mutex(void){
    
    
    DemoBoardLedInitialise();
    
    LEDMutex = xSemaphoreCreateMutex();
    
    xTaskCreate( pTaskFlashBlue_Mutexed,                           /* The function that implements the task. */
					"Blue LED task", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
					MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
					( void * ) NULL,                        /* The parameter passed to the task  */
					TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
					NULL );									/* The task handle is not required, so NULL is passed. */
    xTaskCreate( pTaskFlashRed_Mutexed,                           /* The function that implements the task. */
					"Red LED task", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
					MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
					( void * ) NULL,                        /* The parameter passed to the task  */
					TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
					NULL );									/* The task handle is not required, so NULL is passed. */

    /* Start the tasks . */
    vTaskStartScheduler();
}

/**
 * PRAC9_EXAMPLE_MUTEX
 * Demonstrating the difference between usng a mutex and not using one
 */
void main_example_mutex_extended(void)
{

}

void pTaskFlashBlue_Mutexed( void *pvParameters )
{  
	for( ;; )
	{     
        if ( xSemaphoreTake(LEDMutex,portMAX_DELAY) == pdPASS)  /* we block here until there is a semaphore given to this sempahore */
        {
            DemoBoardToggleLED( DEMOBOARD_BLUE_LED );
            xSemaphoreGive(LEDMutex);
            vTaskDelay(2000);
        }
	}
}

void pTaskFlashRed_Mutexed( void *pvParameters )
{
	for( ;; )
	{     
        if ( xSemaphoreTake(LEDMutex,portMAX_DELAY) == pdPASS)  /* we block here until there is a semaphore given to this sempahore */
        {
            DemoBoardToggleLED( DEMOBOARD_RED_LED );
            xSemaphoreGive(LEDMutex);
            vTaskDelay(250);
        }
	}
}

void pTaskFlashControl( void *pvParameters )
{  
    unsigned long ulLedColour;
	for( ;; )
	{
        xSemaphoreGive(xLedFlashToggleSemaPhore);
        vTaskDelay(2000);           
        xSemaphoreGive(xLedFlashToggleSemaPhore);
        vTaskDelay(2000);           
	}
}

void pTaskFlasher( void *pvParameters )
{  
	for( ;; )
	{
        if ( xSemaphoreTake(xLedFlashToggleSemaPhore,portMAX_DELAY) == pdPASS)  /* we block here until there is a semaphore given to this sempahore */
        {
            DemoBoardToggleLED( DEMOBOARD_BLUE_LED );
        }
	}
}

void pTaskLedHandler( void *pvParameters )
{  
    
    unsigned long ulReceivedValue;
    
	for( ;; )
	{
		/* Wait until something arrives in the queue - this task will block
		indefinitely provided INCLUDE_vTaskSuspend is set to 1 in
		FreeRTOSConfig.h. */
		if ( xQueueReceive( xLedQueue, &ulReceivedValue, portMAX_DELAY ) == pdPASS)
        {
            if( ulReceivedValue == DEMOBOARD_RED_LED )
            {
                DemoBoardSetLED( DEMOBOARD_RED_LED );
            }
            if( ulReceivedValue == DEMOBOARD_GREEN_LED )
            {
                DemoBoardSetLED( DEMOBOARD_GREEN_LED );
            }
            if( ulReceivedValue == DEMOBOARD_BLUE_LED )
            {
                DemoBoardSetLED( DEMOBOARD_BLUE_LED );
            }
            if (ulReceivedValue == DEMOBOARD_ALL_OFF) 
            {
                DemoBoardClearLED( DEMOBOARD_BLUE_LED );
                DemoBoardClearLED( DEMOBOARD_GREEN_LED );
                DemoBoardClearLED( DEMOBOARD_RED_LED );            
            }
        }
        else
        {
            /* Queue did not return an item. */
            /* Ok if we were blocking for a time, but else could be sign of an RTOS crash*/
        }
    }

}

void pTaskLedPoster( void *pvParameters )
{  
    unsigned long ulLedColour;
	for( ;; )
	{
        if (xLedQueue != NULL ){
            ulLedColour = DEMOBOARD_ALL_OFF;
            xQueueSend( xLedQueue, &ulLedColour, 0U );
            ulLedColour = DEMOBOARD_RED_LED;
            xQueueSend( xLedQueue, &ulLedColour, 0U ); // 0 = dont wait/block if queue full
        }
        vTaskDelay(2000);           

        if (xLedQueue != NULL ){
            ulLedColour = DEMOBOARD_ALL_OFF;
            xQueueSend( xLedQueue, &ulLedColour, 0U );
            ulLedColour = DEMOBOARD_GREEN_LED;
            xQueueSend( xLedQueue, &ulLedColour, 0U );;
        }
        vTaskDelay(2000);           
        if (xLedQueue != NULL ){
            ulLedColour = DEMOBOARD_BLUE_LED;
            xQueueSend( xLedQueue, &ulLedColour, 0U );;
            ulLedColour = DEMOBOARD_ALL_OFF;
            xQueueSend( xLedQueue, &ulLedColour, 0U );
        }
        vTaskDelay(2000);           
	}
}


void pTaskCheckTamper( void *pvParameters )
{
    DemoBoardEnableTamper();
    
	for( ;; )
	{
			if (DemoBoardReadTamper() == 0)
                DemoBoardSetLED( DEMOBOARD_RED_LED );
            else
                DemoBoardClearLED( DEMOBOARD_RED_LED );                
            vTaskDelay(100);
            
            
	}
}

void pFToggleGreenLED( TimerHandle_t xTimer ) {
    
  DemoBoardToggleLED( DEMOBOARD_GREEN_LED );  
    
}

#if 0
void main_blinky( void )
{
TimerHandle_t xTimer;

	/* Create the queue. */
	xQueue = xQueueCreate( mainQUEUE_LENGTH, sizeof( unsigned long ) );

	if( xQueue != NULL )
	{
		/* Create the two tasks as described in the comments at the top of this
		file. */
		xTaskCreate( prvQueueReceiveTask,					/* The function that implements the task. */
					"Rx", 									/* The text name assigned to the task - for debug only as it is not used by the kernel. */
					configMINIMAL_STACK_SIZE, 				/* The size of the stack to allocate to the task. */
					( void * ) mainQUEUE_RECEIVE_PARAMETER, /* The parameter passed to the task - just to check the functionality. */
					mainQUEUE_RECEIVE_TASK_PRIORITY, 		/* The priority assigned to the task. */
					NULL );									/* The task handle is not required, so NULL is passed. */

		xTaskCreate( prvQueueSendTask, "TX", configMINIMAL_STACK_SIZE, ( void * ) mainQUEUE_SEND_PARAMETER, mainQUEUE_SEND_TASK_PRIORITY, NULL );

		/* Create the blinky software timer as described at the top of this
		file. */
		xTimer = xTimerCreate( 	"Blinky",					/* A text name, purely to help debugging. */
								( mainBLINKY_TIMER_PERIOD ),/* The timer period. */
								pdTRUE,						/* This is an auto-reload timer, so xAutoReload is set to pdTRUE. */
								( void * ) 0,				/* The ID is not used, so can be set to anything. */
								prvBlinkyTimerCallback		/* The callback function that inspects the status of all the other tasks. */
							);

		if( xTimer != NULL )
		{
			xTimerStart( xTimer, mainDONT_BLOCK );
		}

		/* Start the tasks and timer running. */
		vTaskStartScheduler();
	}

	/* If all is well, the scheduler will now be running, and the following
	line will never be reached.  If the following line does execute, then
	there was insufficient FreeRTOS heap memory available for the idle and/or
	timer tasks	to be created.  See the memory management section on the
	FreeRTOS web site for more details. */
	for( ;; );
}

#void prvQueueSendTask( void *pvParameters )
{
TickType_t xNextWakeTime;
const unsigned long ulValueToSend = 100UL;

	/* Check the task parameter is as expected. */
	configASSERT( ( ( unsigned long ) pvParameters ) == mainQUEUE_SEND_PARAMETER );

	/* Initialise xNextWakeTime - this only needs to be done once. */
	xNextWakeTime = xTaskGetTickCount();

	for( ;; )
	{
		/* Place this task in the blocked state until it is time to run again.
		The block time is specified in ticks, the constant used converts ticks
		to ms.  While in the Blocked state this task will not consume any CPU
		time. */
		vTaskDelayUntil( &xNextWakeTime, mainQUEUE_SEND_FREQUENCY_MS );

		/* Send to the queue - causing the queue receive task to unblock and
		toggle the LED.  0 is used as the block time so the sending operation
		will not block - it shouldn't need to block as the queue should always
		be empty at this point in the code. */
		xQueueSend( xQueue, &ulValueToSend, 0U );
	}
}
/*-----------------------------------------------------------*/

void prvQueueReceiveTask( void *pvParameters )
{
unsigned long ulReceivedValue;

    uint8_t counter = 0;

	/* Check the task parameter is as expected. */
	configASSERT( ( ( unsigned long ) pvParameters ) == mainQUEUE_RECEIVE_PARAMETER );

    DemoBoardLedInitialise();
    
	for( ;; )
	{
		/* Wait until something arrives in the queue - this task will block
		indefinitely provided INCLUDE_vTaskSuspend is set to 1 in
		FreeRTOSConfig.h. */
		xQueueReceive( xQueue, &ulReceivedValue, portMAX_DELAY );

		/*  To get here something must have been received from the queue, but
		is it the expected value?  If it is, toggle the LED. */
		if( ulReceivedValue == 100UL )
		{
			DemoBoardToggleLED( DEMOBOARD_BLUE_LED );
//            if (counter % 2) {
//                DemoBoardSetLED(DEMOBOARD_BLUE_LED);
//            } else {
//                DemoBoardClearLED(DEMOBOARD_BLUE_LED)  ;              
//            }
            counter++;
            
			ulReceivedValue = 0U;
		}
	}
}
/*-----------------------------------------------------------*/

void prvBlinkyTimerCallback( TimerHandle_t xTimer )
{
	/* This function is called when the blinky software time expires.  All the
	function does is toggle the LED.  LED mainTIMER_LED should therefore toggle
	with the period set by mainBLINKY_TIMER_PERIOD. */
	//vParTestToggleLED( DEMOBOARD_GREEN_LED );
}

#endif
/* configSUPPORT_STATIC_ALLOCATION is set to 1, so the application must provide an
implementation of vApplicationGetIdleTaskMemory() to provide the memory that is
used by the Idle task. */
void vApplicationGetIdleTaskMemory( StaticTask_t **ppxIdleTaskTCBBuffer,
                                    StackType_t **ppxIdleTaskStackBuffer,
                                    uint32_t *pulIdleTaskStackSize )
{
/* If the buffers to be provided to the Idle task are declared inside this
function then they must be declared static - otherwise they will be allocated on
the stack and so not exists after this function exits. */
static StaticTask_t xIdleTaskTCB;
static StackType_t uxIdleTaskStack[ configMINIMAL_STACK_SIZE ];

    /* Pass out a pointer to the StaticTask_t structure in which the Idle task's
    state will be stored. */
    *ppxIdleTaskTCBBuffer = &xIdleTaskTCB;

    /* Pass out the array that will be used as the Idle task's stack. */
    *ppxIdleTaskStackBuffer = uxIdleTaskStack;

    /* Pass out the size of the array pointed to by *ppxIdleTaskStackBuffer.
    Note that, as the array is necessarily of type StackType_t,
    configMINIMAL_STACK_SIZE is specified in words, not bytes. */
    *pulIdleTaskStackSize = configMINIMAL_STACK_SIZE;
}
/*-----------------------------------------------------------*/

/* configSUPPORT_STATIC_ALLOCATION and configUSE_TIMERS are both set to 1, so the
application must provide an implementation of vApplicationGetTimerTaskMemory()
to provide the memory that is used by the Timer service task. */
void vApplicationGetTimerTaskMemory( StaticTask_t **ppxTimerTaskTCBBuffer,
                                     StackType_t **ppxTimerTaskStackBuffer,
                                     uint32_t *pulTimerTaskStackSize )
{
/* If the buffers to be provided to the Timer task are declared inside this
function then they must be declared static - otherwise they will be allocated on
the stack and so not exists after this function exits. */
static StaticTask_t xTimerTaskTCB;
static StackType_t uxTimerTaskStack[ configTIMER_TASK_STACK_DEPTH ];

    /* Pass out a pointer to the StaticTask_t structure in which the Timer
    task's state will be stored. */
    *ppxTimerTaskTCBBuffer = &xTimerTaskTCB;

    /* Pass out the array that will be used as the Timer task's stack. */
    *ppxTimerTaskStackBuffer = uxTimerTaskStack;

    /* Pass out the size of the array pointed to by *ppxTimerTaskStackBuffer.
    Note that, as the array is necessarily of type StackType_t,
    configTIMER_TASK_STACK_DEPTH is specified in words, not bytes. */
    *pulTimerTaskStackSize = configTIMER_TASK_STACK_DEPTH;
}