#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-EXPLORER_16_PIC32MM_GPM.mk)" "nbproject/Makefile-local-EXPLORER_16_PIC32MM_GPM.mk"
include nbproject/Makefile-local-EXPLORER_16_PIC32MM_GPM.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=EXPLORER_16_PIC32MM_GPM
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_PIC32MM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_PIC32MM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../../Source/queue.c ../../../Source/tasks.c ../../../Source/list.c ../../../Source/timers.c ../../../Source/portable/MemMang/heap_4.c ../../../Source/portable/MPLAB/PIC32MM/port_asm.S ../../../Source/portable/MPLAB/PIC32MM/port.c ../../Common/Minimal/blocktim.c ../../Common/Minimal/semtest.c ../../Common/Minimal/QPeek.c ../../Common/Minimal/IntQueue.c ../../Common/Minimal/GenQTest.c ../../Common/Minimal/flash_timer.c ../RegisterTestTasks.S ../timertest.c ../timertest_isr.S ../IntQueueTimer.c ../IntQueueTimer_isr.S ../printf-stdarg.c ../main_blinky.c ../main_full.c ../ConfigPerformance.c ../lcd.c ../main.c ../ParTest/demo_board.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/449926602/queue.o ${OBJECTDIR}/_ext/449926602/tasks.o ${OBJECTDIR}/_ext/449926602/list.o ${OBJECTDIR}/_ext/449926602/timers.o ${OBJECTDIR}/_ext/1884096877/heap_4.o ${OBJECTDIR}/_ext/332309685/port_asm.o ${OBJECTDIR}/_ext/332309685/port.o ${OBJECTDIR}/_ext/1163846883/blocktim.o ${OBJECTDIR}/_ext/1163846883/semtest.o ${OBJECTDIR}/_ext/1163846883/QPeek.o ${OBJECTDIR}/_ext/1163846883/IntQueue.o ${OBJECTDIR}/_ext/1163846883/GenQTest.o ${OBJECTDIR}/_ext/1163846883/flash_timer.o ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o ${OBJECTDIR}/_ext/1472/timertest.o ${OBJECTDIR}/_ext/1472/timertest_isr.o ${OBJECTDIR}/_ext/1472/IntQueueTimer.o ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o ${OBJECTDIR}/_ext/1472/printf-stdarg.o ${OBJECTDIR}/_ext/1472/main_blinky.o ${OBJECTDIR}/_ext/1472/main_full.o ${OBJECTDIR}/_ext/1472/ConfigPerformance.o ${OBJECTDIR}/_ext/1472/lcd.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/809743516/demo_board.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/449926602/queue.o.d ${OBJECTDIR}/_ext/449926602/tasks.o.d ${OBJECTDIR}/_ext/449926602/list.o.d ${OBJECTDIR}/_ext/449926602/timers.o.d ${OBJECTDIR}/_ext/1884096877/heap_4.o.d ${OBJECTDIR}/_ext/332309685/port_asm.o.d ${OBJECTDIR}/_ext/332309685/port.o.d ${OBJECTDIR}/_ext/1163846883/blocktim.o.d ${OBJECTDIR}/_ext/1163846883/semtest.o.d ${OBJECTDIR}/_ext/1163846883/QPeek.o.d ${OBJECTDIR}/_ext/1163846883/IntQueue.o.d ${OBJECTDIR}/_ext/1163846883/GenQTest.o.d ${OBJECTDIR}/_ext/1163846883/flash_timer.o.d ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.d ${OBJECTDIR}/_ext/1472/timertest.o.d ${OBJECTDIR}/_ext/1472/timertest_isr.o.d ${OBJECTDIR}/_ext/1472/IntQueueTimer.o.d ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.d ${OBJECTDIR}/_ext/1472/printf-stdarg.o.d ${OBJECTDIR}/_ext/1472/main_blinky.o.d ${OBJECTDIR}/_ext/1472/main_full.o.d ${OBJECTDIR}/_ext/1472/ConfigPerformance.o.d ${OBJECTDIR}/_ext/1472/lcd.o.d ${OBJECTDIR}/_ext/1472/main.o.d ${OBJECTDIR}/_ext/809743516/demo_board.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/449926602/queue.o ${OBJECTDIR}/_ext/449926602/tasks.o ${OBJECTDIR}/_ext/449926602/list.o ${OBJECTDIR}/_ext/449926602/timers.o ${OBJECTDIR}/_ext/1884096877/heap_4.o ${OBJECTDIR}/_ext/332309685/port_asm.o ${OBJECTDIR}/_ext/332309685/port.o ${OBJECTDIR}/_ext/1163846883/blocktim.o ${OBJECTDIR}/_ext/1163846883/semtest.o ${OBJECTDIR}/_ext/1163846883/QPeek.o ${OBJECTDIR}/_ext/1163846883/IntQueue.o ${OBJECTDIR}/_ext/1163846883/GenQTest.o ${OBJECTDIR}/_ext/1163846883/flash_timer.o ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o ${OBJECTDIR}/_ext/1472/timertest.o ${OBJECTDIR}/_ext/1472/timertest_isr.o ${OBJECTDIR}/_ext/1472/IntQueueTimer.o ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o ${OBJECTDIR}/_ext/1472/printf-stdarg.o ${OBJECTDIR}/_ext/1472/main_blinky.o ${OBJECTDIR}/_ext/1472/main_full.o ${OBJECTDIR}/_ext/1472/ConfigPerformance.o ${OBJECTDIR}/_ext/1472/lcd.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/809743516/demo_board.o

# Source Files
SOURCEFILES=../../../Source/queue.c ../../../Source/tasks.c ../../../Source/list.c ../../../Source/timers.c ../../../Source/portable/MemMang/heap_4.c ../../../Source/portable/MPLAB/PIC32MM/port_asm.S ../../../Source/portable/MPLAB/PIC32MM/port.c ../../Common/Minimal/blocktim.c ../../Common/Minimal/semtest.c ../../Common/Minimal/QPeek.c ../../Common/Minimal/IntQueue.c ../../Common/Minimal/GenQTest.c ../../Common/Minimal/flash_timer.c ../RegisterTestTasks.S ../timertest.c ../timertest_isr.S ../IntQueueTimer.c ../IntQueueTimer_isr.S ../printf-stdarg.c ../main_blinky.c ../main_full.c ../ConfigPerformance.c ../lcd.c ../main.c ../ParTest/demo_board.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-EXPLORER_16_PIC32MM_GPM.mk dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_PIC32MM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MM0256GPM064
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/332309685/port_asm.o: ../../../Source/portable/MPLAB/PIC32MM/port_asm.S  .generated_files/7f9021fd84c7713199a9a906b3ba5c269fb0f126.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/332309685" 
	@${RM} ${OBJECTDIR}/_ext/332309685/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/332309685/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/332309685/port_asm.o.ok ${OBJECTDIR}/_ext/332309685/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/332309685/port_asm.o.d"  -o ${OBJECTDIR}/_ext/332309685/port_asm.o ../../../Source/portable/MPLAB/PIC32MM/port_asm.S  -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/332309685/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MX -I ../../Common/include -I ../ -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/332309685/port_asm.o.d" "${OBJECTDIR}/_ext/332309685/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/RegisterTestTasks.o: ../RegisterTestTasks.S  .generated_files/71098ab0af06e8a30a33fcba04f13052bcef4bc4.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o 
	@${RM} ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.ok ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.d"  -o ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o ../RegisterTestTasks.S  -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MX -I ../../Common/include -I ../ -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.d" "${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/timertest_isr.o: ../timertest_isr.S  .generated_files/d6a6165682407181178eae5a3abe5709a0d248b9.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/timertest_isr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/timertest_isr.o 
	@${RM} ${OBJECTDIR}/_ext/1472/timertest_isr.o.ok ${OBJECTDIR}/_ext/1472/timertest_isr.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/timertest_isr.o.d"  -o ${OBJECTDIR}/_ext/1472/timertest_isr.o ../timertest_isr.S  -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1472/timertest_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MX -I ../../Common/include -I ../ -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/timertest_isr.o.d" "${OBJECTDIR}/_ext/1472/timertest_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o: ../IntQueueTimer_isr.S  .generated_files/11e3a5a1507b2b542691d164d4ef0078e9dd519d.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o 
	@${RM} ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.ok ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.d"  -o ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o ../IntQueueTimer_isr.S  -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MX -I ../../Common/include -I ../ -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.d" "${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/332309685/port_asm.o: ../../../Source/portable/MPLAB/PIC32MM/port_asm.S  .generated_files/8075eeace38d16c168f02d3aa4af3afa275a75f7.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/332309685" 
	@${RM} ${OBJECTDIR}/_ext/332309685/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/332309685/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/332309685/port_asm.o.ok ${OBJECTDIR}/_ext/332309685/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/332309685/port_asm.o.d"  -o ${OBJECTDIR}/_ext/332309685/port_asm.o ../../../Source/portable/MPLAB/PIC32MM/port_asm.S  -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/332309685/port_asm.o.asm.d",--gdwarf-2 -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MX -I ../../Common/include -I ../ -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/332309685/port_asm.o.d" "${OBJECTDIR}/_ext/332309685/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/RegisterTestTasks.o: ../RegisterTestTasks.S  .generated_files/c752ce73b52808253adcf795f74066f772937706.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o 
	@${RM} ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.ok ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.d"  -o ${OBJECTDIR}/_ext/1472/RegisterTestTasks.o ../RegisterTestTasks.S  -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.asm.d",--gdwarf-2 -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MX -I ../../Common/include -I ../ -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.d" "${OBJECTDIR}/_ext/1472/RegisterTestTasks.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/timertest_isr.o: ../timertest_isr.S  .generated_files/e74ae9d0246d2244f099539a24990224f575a847.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/timertest_isr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/timertest_isr.o 
	@${RM} ${OBJECTDIR}/_ext/1472/timertest_isr.o.ok ${OBJECTDIR}/_ext/1472/timertest_isr.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/timertest_isr.o.d"  -o ${OBJECTDIR}/_ext/1472/timertest_isr.o ../timertest_isr.S  -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1472/timertest_isr.o.asm.d",--gdwarf-2 -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MX -I ../../Common/include -I ../ -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/timertest_isr.o.d" "${OBJECTDIR}/_ext/1472/timertest_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o: ../IntQueueTimer_isr.S  .generated_files/f6962d95fc860f738246d76731d2f46319c11486.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o 
	@${RM} ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.ok ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.d"  -o ${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o ../IntQueueTimer_isr.S  -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.asm.d",--gdwarf-2 -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MX -I ../../Common/include -I ../ -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.d" "${OBJECTDIR}/_ext/1472/IntQueueTimer_isr.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/449926602/queue.o: ../../../Source/queue.c  .generated_files/1bf4b980f2aa8071c4e28986b05c98b8607681b9.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/449926602/queue.o.d" -o ${OBJECTDIR}/_ext/449926602/queue.o ../../../Source/queue.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/449926602/tasks.o: ../../../Source/tasks.c  .generated_files/20a56736eb3784f87791d22d72f761997badd970.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/449926602/tasks.o.d" -o ${OBJECTDIR}/_ext/449926602/tasks.o ../../../Source/tasks.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/449926602/list.o: ../../../Source/list.c  .generated_files/51d98a7eda8e4202392f6653ad7cc52e8cff3edc.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/449926602/list.o.d" -o ${OBJECTDIR}/_ext/449926602/list.o ../../../Source/list.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/449926602/timers.o: ../../../Source/timers.c  .generated_files/bc528476c50ebd1f47e7ffbf74af0219fa7032a6.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/449926602/timers.o.d" -o ${OBJECTDIR}/_ext/449926602/timers.o ../../../Source/timers.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1884096877/heap_4.o: ../../../Source/portable/MemMang/heap_4.c  .generated_files/b4bd0d4a9c88a514fb996a0ba0f21f78d745594.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1884096877" 
	@${RM} ${OBJECTDIR}/_ext/1884096877/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1884096877/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1884096877/heap_4.o.d" -o ${OBJECTDIR}/_ext/1884096877/heap_4.o ../../../Source/portable/MemMang/heap_4.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/332309685/port.o: ../../../Source/portable/MPLAB/PIC32MM/port.c  .generated_files/4b1cd5f8a55c55693154b101760757960869bb3e.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/332309685" 
	@${RM} ${OBJECTDIR}/_ext/332309685/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/332309685/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/332309685/port.o.d" -o ${OBJECTDIR}/_ext/332309685/port.o ../../../Source/portable/MPLAB/PIC32MM/port.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163846883/blocktim.o: ../../Common/Minimal/blocktim.c  .generated_files/196ce207921c7bb2c1126f12e32a18cb02d7d686.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1163846883" 
	@${RM} ${OBJECTDIR}/_ext/1163846883/blocktim.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163846883/blocktim.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1163846883/blocktim.o.d" -o ${OBJECTDIR}/_ext/1163846883/blocktim.o ../../Common/Minimal/blocktim.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163846883/semtest.o: ../../Common/Minimal/semtest.c  .generated_files/a8b07265c675e1af063e0c9e86f279288b3a778.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1163846883" 
	@${RM} ${OBJECTDIR}/_ext/1163846883/semtest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163846883/semtest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1163846883/semtest.o.d" -o ${OBJECTDIR}/_ext/1163846883/semtest.o ../../Common/Minimal/semtest.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163846883/QPeek.o: ../../Common/Minimal/QPeek.c  .generated_files/91443d4601f3965cbf65e6841ac6e55dcd5ff6bb.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1163846883" 
	@${RM} ${OBJECTDIR}/_ext/1163846883/QPeek.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163846883/QPeek.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1163846883/QPeek.o.d" -o ${OBJECTDIR}/_ext/1163846883/QPeek.o ../../Common/Minimal/QPeek.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163846883/IntQueue.o: ../../Common/Minimal/IntQueue.c  .generated_files/55c18b9e3b427ab3c15a3ef08474224cba60c233.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1163846883" 
	@${RM} ${OBJECTDIR}/_ext/1163846883/IntQueue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163846883/IntQueue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1163846883/IntQueue.o.d" -o ${OBJECTDIR}/_ext/1163846883/IntQueue.o ../../Common/Minimal/IntQueue.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163846883/GenQTest.o: ../../Common/Minimal/GenQTest.c  .generated_files/acfdabc148cf9f36ffa0804bf9031a4b737930ba.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1163846883" 
	@${RM} ${OBJECTDIR}/_ext/1163846883/GenQTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163846883/GenQTest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1163846883/GenQTest.o.d" -o ${OBJECTDIR}/_ext/1163846883/GenQTest.o ../../Common/Minimal/GenQTest.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163846883/flash_timer.o: ../../Common/Minimal/flash_timer.c  .generated_files/7836f7e3b60b6e27cab4e4ed259cea875d66c3cd.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1163846883" 
	@${RM} ${OBJECTDIR}/_ext/1163846883/flash_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163846883/flash_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1163846883/flash_timer.o.d" -o ${OBJECTDIR}/_ext/1163846883/flash_timer.o ../../Common/Minimal/flash_timer.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/timertest.o: ../timertest.c  .generated_files/7230327596abde81a648dc665f98a203f2f71ca2.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/timertest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/timertest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/timertest.o.d" -o ${OBJECTDIR}/_ext/1472/timertest.o ../timertest.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/IntQueueTimer.o: ../IntQueueTimer.c  .generated_files/bb64070de08add978be3a69682e29f1c683221f4.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/IntQueueTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/IntQueueTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/IntQueueTimer.o.d" -o ${OBJECTDIR}/_ext/1472/IntQueueTimer.o ../IntQueueTimer.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/printf-stdarg.o: ../printf-stdarg.c  .generated_files/fdc2f901a88cf72056cdc626bcfa55cf983cb8b3.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/printf-stdarg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/printf-stdarg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/printf-stdarg.o.d" -o ${OBJECTDIR}/_ext/1472/printf-stdarg.o ../printf-stdarg.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/main_blinky.o: ../main_blinky.c  .generated_files/92b99dc65e86cdf009c39d718c38ad0005ec9f9b.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main_blinky.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_blinky.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main_blinky.o.d" -o ${OBJECTDIR}/_ext/1472/main_blinky.o ../main_blinky.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/main_full.o: ../main_full.c  .generated_files/dfb56f0433d919e6d9c19a8be8e86781418f5751.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main_full.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_full.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main_full.o.d" -o ${OBJECTDIR}/_ext/1472/main_full.o ../main_full.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/ConfigPerformance.o: ../ConfigPerformance.c  .generated_files/75755b157b3e178a3248b448286bbdfa554415b3.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/ConfigPerformance.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/ConfigPerformance.o.d" -o ${OBJECTDIR}/_ext/1472/ConfigPerformance.o ../ConfigPerformance.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/lcd.o: ../lcd.c  .generated_files/cf3d312a514322db68c33f52e183ac8841195ebf.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/lcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/lcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/lcd.o.d" -o ${OBJECTDIR}/_ext/1472/lcd.o ../lcd.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/412b5c36eb668871d731cba593c7fc49f98c492f.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d" -o ${OBJECTDIR}/_ext/1472/main.o ../main.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/809743516/demo_board.o: ../ParTest/demo_board.c  .generated_files/4113fc0c8710f67564d3f05388bd1b40c049a2fe.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/809743516" 
	@${RM} ${OBJECTDIR}/_ext/809743516/demo_board.o.d 
	@${RM} ${OBJECTDIR}/_ext/809743516/demo_board.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/809743516/demo_board.o.d" -o ${OBJECTDIR}/_ext/809743516/demo_board.o ../ParTest/demo_board.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/449926602/queue.o: ../../../Source/queue.c  .generated_files/5a01f053f349a791a6d2cbac9155baebdced48d1.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/449926602/queue.o.d" -o ${OBJECTDIR}/_ext/449926602/queue.o ../../../Source/queue.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/449926602/tasks.o: ../../../Source/tasks.c  .generated_files/19ab44d0ae9533671141e7b5a4916e4902d5c05b.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/449926602/tasks.o.d" -o ${OBJECTDIR}/_ext/449926602/tasks.o ../../../Source/tasks.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/449926602/list.o: ../../../Source/list.c  .generated_files/e96f70a06f771de557cc9c17240420dded37a1f7.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/449926602/list.o.d" -o ${OBJECTDIR}/_ext/449926602/list.o ../../../Source/list.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/449926602/timers.o: ../../../Source/timers.c  .generated_files/ac464e108bc325e2cba57f153fffee840d156773.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/449926602" 
	@${RM} ${OBJECTDIR}/_ext/449926602/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/449926602/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/449926602/timers.o.d" -o ${OBJECTDIR}/_ext/449926602/timers.o ../../../Source/timers.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1884096877/heap_4.o: ../../../Source/portable/MemMang/heap_4.c  .generated_files/51fcb6f3c1f45170fec9c644f6e266b627621b15.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1884096877" 
	@${RM} ${OBJECTDIR}/_ext/1884096877/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1884096877/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1884096877/heap_4.o.d" -o ${OBJECTDIR}/_ext/1884096877/heap_4.o ../../../Source/portable/MemMang/heap_4.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/332309685/port.o: ../../../Source/portable/MPLAB/PIC32MM/port.c  .generated_files/168bf621d966155701caa3ec4b5497112d0a36f3.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/332309685" 
	@${RM} ${OBJECTDIR}/_ext/332309685/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/332309685/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/332309685/port.o.d" -o ${OBJECTDIR}/_ext/332309685/port.o ../../../Source/portable/MPLAB/PIC32MM/port.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163846883/blocktim.o: ../../Common/Minimal/blocktim.c  .generated_files/b7685394d07a123e53879185e22aee94378df25d.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1163846883" 
	@${RM} ${OBJECTDIR}/_ext/1163846883/blocktim.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163846883/blocktim.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1163846883/blocktim.o.d" -o ${OBJECTDIR}/_ext/1163846883/blocktim.o ../../Common/Minimal/blocktim.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163846883/semtest.o: ../../Common/Minimal/semtest.c  .generated_files/b5fc62bb09b62de5437945d64b17bb2f60e9113e.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1163846883" 
	@${RM} ${OBJECTDIR}/_ext/1163846883/semtest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163846883/semtest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1163846883/semtest.o.d" -o ${OBJECTDIR}/_ext/1163846883/semtest.o ../../Common/Minimal/semtest.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163846883/QPeek.o: ../../Common/Minimal/QPeek.c  .generated_files/99fae2d7b9b801fe0352815be6eb580d032f9430.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1163846883" 
	@${RM} ${OBJECTDIR}/_ext/1163846883/QPeek.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163846883/QPeek.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1163846883/QPeek.o.d" -o ${OBJECTDIR}/_ext/1163846883/QPeek.o ../../Common/Minimal/QPeek.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163846883/IntQueue.o: ../../Common/Minimal/IntQueue.c  .generated_files/e77fedbe980d7830a7136e86cb0d89b2eab690dd.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1163846883" 
	@${RM} ${OBJECTDIR}/_ext/1163846883/IntQueue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163846883/IntQueue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1163846883/IntQueue.o.d" -o ${OBJECTDIR}/_ext/1163846883/IntQueue.o ../../Common/Minimal/IntQueue.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163846883/GenQTest.o: ../../Common/Minimal/GenQTest.c  .generated_files/6fcf5c6ce89eade80bc8b059ce24e06c9d572933.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1163846883" 
	@${RM} ${OBJECTDIR}/_ext/1163846883/GenQTest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163846883/GenQTest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1163846883/GenQTest.o.d" -o ${OBJECTDIR}/_ext/1163846883/GenQTest.o ../../Common/Minimal/GenQTest.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1163846883/flash_timer.o: ../../Common/Minimal/flash_timer.c  .generated_files/5f3f722c75c70bb0bea9b964d15830ae8ed8f872.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1163846883" 
	@${RM} ${OBJECTDIR}/_ext/1163846883/flash_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1163846883/flash_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1163846883/flash_timer.o.d" -o ${OBJECTDIR}/_ext/1163846883/flash_timer.o ../../Common/Minimal/flash_timer.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/timertest.o: ../timertest.c  .generated_files/deaafaff80650923fdf755ebf0799a87d84b01bc.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/timertest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/timertest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/timertest.o.d" -o ${OBJECTDIR}/_ext/1472/timertest.o ../timertest.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/IntQueueTimer.o: ../IntQueueTimer.c  .generated_files/f341d5489daee5e9a3f8c9b0c9baaa2107835166.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/IntQueueTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/IntQueueTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/IntQueueTimer.o.d" -o ${OBJECTDIR}/_ext/1472/IntQueueTimer.o ../IntQueueTimer.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/printf-stdarg.o: ../printf-stdarg.c  .generated_files/dd8ec48bfc36db13603d204bb0ad182f03f74244.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/printf-stdarg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/printf-stdarg.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/printf-stdarg.o.d" -o ${OBJECTDIR}/_ext/1472/printf-stdarg.o ../printf-stdarg.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/main_blinky.o: ../main_blinky.c  .generated_files/a799bd5fc09f6207766ee35205915efec546c706.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main_blinky.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_blinky.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main_blinky.o.d" -o ${OBJECTDIR}/_ext/1472/main_blinky.o ../main_blinky.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/main_full.o: ../main_full.c  .generated_files/53228ac659c048a97dc12354394a3b6c2191efe2.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main_full.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main_full.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main_full.o.d" -o ${OBJECTDIR}/_ext/1472/main_full.o ../main_full.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/ConfigPerformance.o: ../ConfigPerformance.c  .generated_files/48717f783613d7f2a2d6e5c2d162ac74d55f00eb.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/ConfigPerformance.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/ConfigPerformance.o.d" -o ${OBJECTDIR}/_ext/1472/ConfigPerformance.o ../ConfigPerformance.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/lcd.o: ../lcd.c  .generated_files/8295b549c7ecf525c23e36d668c32373df4786ec.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/lcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/lcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/lcd.o.d" -o ${OBJECTDIR}/_ext/1472/lcd.o ../lcd.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  .generated_files/1e7504faea494e650441a0c510f21f1d752fe968.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d" -o ${OBJECTDIR}/_ext/1472/main.o ../main.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/809743516/demo_board.o: ../ParTest/demo_board.c  .generated_files/4a02fe60dba58baa7aeea559a36e014ecbcf7be2.flag .generated_files/b08eef43ac82a2cc22fcb9591e3918fb4517435d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/809743516" 
	@${RM} ${OBJECTDIR}/_ext/809743516/demo_board.o.d 
	@${RM} ${OBJECTDIR}/_ext/809743516/demo_board.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -I"../../../Source/include" -I"../../Common/include" -I"../../../Source/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/_ext/809743516/demo_board.o.d" -o ${OBJECTDIR}/_ext/809743516/demo_board.o ../ParTest/demo_board.c    -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -I ../../../Source/include -I ../../../Source/portable/MPLAB/PIC32MM -I ../../Common/include -I ../ -I .. -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_PIC32MM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_ICD4=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_PIC32MM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC016FF -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_ICD4=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_PIC32MM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_PIC32MM.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_EXPLORER_16_PIC32MM_GPM=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/RTOSDemo_PIC32MM.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/EXPLORER_16_PIC32MM_GPM
	${RM} -r dist/EXPLORER_16_PIC32MM_GPM

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
