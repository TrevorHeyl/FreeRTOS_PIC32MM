
/* Kernel includes. */
#include "FreeRTOS.h"
#include "task.h"

/* Standard demo includes. */
#include "demo_board.h"

/* Hardware specific includes. */
#include "ConfigPerformance.h"

/* Set mainCREATE_SIMPLE_BLINKY_DEMO_ONLY to one to run the simple blinky demo,
or 0 to run the more comprehensive test and demo application. */
#define RTOS_EXAMPLE_SIMPLE_TASK    0
#define RTOS_EXAMPLE_TWO_TASKS      0
#define RTOS_EXAMPLE_STATIC_TASK    0
#define RTOS_EXAMPLE_INTERRUPT      0
#define RTOS_EXAMPLE_TIMER          0
#define RTOS_EXAMPLE_QUEUE          0
#define RTOS_EXAMPLE_SEMAPHORE      1


/*-----------------------------------------------------------*/

/*
 * Set up the hardware ready to run this demo.
 */
static void SetupHardware( void );


/*-----------------------------------------------------------*/

/*
 * Create the demo tasks then start the scheduler.
 */
int main( void ) {
	/* Prepare the hardware to run this demo. */
	SetupHardware();
    
    /* Select demo to use */
    #if  RTOS_EXAMPLE_SIMPLE_TASK == 1 
	{
		main_example_simple_task();
	}
   #elif  RTOS_EXAMPLE_TWO_TASKS == 1
	{
		main_example_two_tasks();
	}
   #elif RTOS_EXAMPLE_STATIC_TASK == 1
    {
        main_example_static_task();
    }
    #elif RTOS_EXAMPLE_INTERRUPT == 1
    {
        main_example_interrupt();  
    }
    #elif RTOS_EXAMPLE_TIMER == 1
    {
        main_timer_example();
    }
    #elif RTOS_EXAMPLE_QUEUE == 1
    {
        main_queue_example();
    }
    #elif RTOS_EXAMPLE_SEMAPHORE == 1
    {
        main_example_semaphore();
    }
    #else
        ##error PLEASE define at least one EXAMPLE
	#endif

    /* If we failed to start the RTOS we return here and make the LEDS white*/    
    while(1) {
        DemoBoardToggleLED( DEMOBOARD_RED_LED );
        DemoBoardToggleLED( DEMOBOARD_BLUE_LED );
        DemoBoardToggleLED( DEMOBOARD_GREEN_LED );
    }

	return 0;
}
/*-----------------------------------------------------------*/

static void SetupHardware( void )
{
    /* Configure the hardware for maximum performance. */
	vHardwareConfigurePerformance();


	/* Setup to use the external interrupt controller. */
	vHardwareUseMultiVectoredInterrupts();

	portDISABLE_INTERRUPTS();

	/* Setup the digital IO for the LED's. */
	DemoBoardLedInitialise();
    
    
}
/*-----------------------------------------------------------*/

void vApplicationMallocFailedHook( void )
{
	/* vApplicationMallocFailedHook() will only be called if
	configUSE_MALLOC_FAILED_HOOK is set to 1 in FreeRTOSConfig.h.  It is a hook
	function that will get called if a call to pvPortMalloc() fails.
	pvPortMalloc() is called internally by the kernel whenever a task, queue,
	timer or semaphore is created.  It is also called by various parts of the
	demo application.  If heap_1.c or heap_2.c are used, then the size of the
	heap available to pvPortMalloc() is defined by configTOTAL_HEAP_SIZE in
	FreeRTOSConfig.h, and the xPortGetFreeHeapSize() API function can be used
	to query the size of free heap space that remains (although it does not
	provide information on how the remaining heap might be fragmented). */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationIdleHook( void )
{
	/* vApplicationIdleHook() will only be called if configUSE_IDLE_HOOK is set
	to 1 in FreeRTOSConfig.h.  It will be called on each iteration of the idle
	task.  It is essential that code added to this hook function never attempts
	to block in any way (for example, call xQueueReceive() with a block time
	specified, or call vTaskDelay()).  If the application makes use of the
	vTaskDelete() API function (as this demo application does) then it is also
	important that vApplicationIdleHook() is permitted to return to its calling
	function, because it is the responsibility of the idle task to clean up
	memory allocated by the kernel to any task that has since been deleted. */
}
/*-----------------------------------------------------------*/

void vApplicationStackOverflowHook( TaskHandle_t pxTask, char *pcTaskName )
{
	( void ) pcTaskName;
	( void ) pxTask;

	/* Run time task stack overflow checking is performed if
	configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook	function is 
	called if a task stack overflow is detected.  Note the system/interrupt
	stack is not checked. */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationTickHook( void )
{
	/* This function will be called by each tick interrupt if
	configUSE_TICK_HOOK is set to 1 in FreeRTOSConfig.h.  User code can be
	added here, but the tick hook is called from an interrupt context, so
	code must not attempt to block, and only the interrupt safe FreeRTOS API
	functions can be used (those that end in FromISR()). */
}
/*-----------------------------------------------------------*/

void _general_exception_handler( unsigned long ulCause, unsigned long ulStatus )
{
	/* This overrides the definition provided by the kernel.  Other exceptions 
	should be handled here. */
	Nop();
    for( ;; );
}
/*-----------------------------------------------------------*/

void vAssertCalled( const char * pcFile, unsigned long ulLine )
{
volatile unsigned long ul = 0;

	( void ) pcFile;
	( void ) ulLine;

	__asm volatile( "di" );
	{
		/* Set ul to a non-zero value using the debugger to step out of this
		function. */
		while( ul == 0 )
		{
			portNOP();
		}
	}
	__asm volatile( "ei" );
}
