/* Standard includes. */
#include <stdio.h>

/* Kernel includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"

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
#define mainQUEUE_LENGTH					( 1 )

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
static void pTaskFlashRed_2Hz( void *pvParameters );
static void pTaskFlashBlue_0_5Hz( void *pvParameters );
static void pTaskCheckTamper( void *pvParameters );
static void pFToggleGreenLED( TimerHandle_t xTimer );




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


/*-----------------------------------------------------------*/

/* The queue used by both tasks. */
static QueueHandle_t xQueue = NULL;

/*-----------------------------------------------------------*/



/**
 * RTOS_EXAMPLE_SIMPLE_TASK
 * Simple task, only one task running, flashing an LED at 1Hz
 */
void main_example_simple_task (void ){
    
    DemoBoardLedInitialise();
    
    xTaskCreate( pTaskFlashBlue_0_5Hz,                           /* The function that implements the task. */
		"Simple", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
		MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
		( void * ) NULL,                        /* The parameter passed to the task  */
		TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
		NULL  );									/* . */

	/* Start the task */
	vTaskStartScheduler();
	
}

/**
 * RTOS_EXAMPLE_TWO_TASKS
 * Simple tasks, each flashing a different  LED at a different rate
 */
void main_example_two_tasks (void ){
		
        DemoBoardLedInitialise();
    
        xTaskCreate( pTaskFlashBlue_0_5Hz,                           /* The function that implements the task. */
					"Simple", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
					MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
					( void * ) NULL,                        /* The parameter passed to the task  */
					TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
					NULL );									/* The task handle is not required, so NULL is passed. */
        xTaskCreate( pTaskFlashRed_2Hz,                           /* The function that implements the task. */
					"Simple", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
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

StaticTask_t xTaskBlueBuffer;
StackType_t  xStackBlue[MINIMAL_TASK_STACK_SIZE];

/**
 * RTOS_EXAMPLE_STATIC_TASK
 * Simple task, only one task running, flashing an LED at 1Hz
 * Task uses static memory stack. If only static stack tasks are created then we can define the heap size to 0
 * This is useful if dynamic memory allocation is not required or wanted 
 */
void main_example_static_task (void ){
    
    xTaskCreateStatic( pTaskFlashBlue_0_5Hz,                           /* The function that implements the task. */
		"Simple", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
		MINIMAL_TASK_STACK_SIZE,                  /* The size of the stack to allocate to the task. */
		( void * ) NULL,                        /* The parameter passed to the task  */
		TASK_LOW_PRIORITY,                      /* The priority assigned to the task. */
		 xStackBlue ,&xTaskBlueBuffer  );		/* Task control block and stack memory */

		/* Start the task */
	vTaskStartScheduler();
	
}


void main_timer_example(void) {

    TimerHandle_t aTimer;

    DemoBoardLedInitialise();
    
    xTaskCreate( pTaskFlashBlue_0_5Hz,                           /* The function that implements the task. */
		"Simple", 								/* The text name assigned to the task - for debug only as it is not used by the kernel. */
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

static void pTaskFlashBlue_0_5Hz( void *pvParameters )
{  
	for( ;; )
	{
        DemoBoardToggleLED( DEMOBOARD_BLUE_LED );
        vTaskDelay(2000);           
	}
}

static void pTaskFlashRed_2Hz( void *pvParameters )
{

    
	for( ;; )
	{
			DemoBoardToggleLED( DEMOBOARD_RED_LED );
            vTaskDelay(250);
            
	}
}

static void pTaskCheckTamper( void *pvParameters )
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

static void pFToggleGreenLED( TimerHandle_t xTimer ) {
    
  DemoBoardToggleLED( DEMOBOARD_GREEN_LED );  
    
}


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
/*-----------------------------------------------------------*/

static void prvQueueSendTask( void *pvParameters )
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

static void prvQueueReceiveTask( void *pvParameters )
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

static void prvBlinkyTimerCallback( TimerHandle_t xTimer )
{
	/* This function is called when the blinky software time expires.  All the
	function does is toggle the LED.  LED mainTIMER_LED should therefore toggle
	with the period set by mainBLINKY_TIMER_PERIOD. */
	//vParTestToggleLED( DEMOBOARD_GREEN_LED );
}


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