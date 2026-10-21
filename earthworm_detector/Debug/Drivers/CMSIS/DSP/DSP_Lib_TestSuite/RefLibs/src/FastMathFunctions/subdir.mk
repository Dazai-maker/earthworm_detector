################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/cos.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sin.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sqrt.c 

C_DEPS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/cos.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sin.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sqrt.d 

OBJS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/cos.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sin.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sqrt.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/%.o Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/%.su Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/%.cyclo: ../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/%.c Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../TouchGFX/App -I../TouchGFX/target/generated -I../TouchGFX/target -I../USB_HOST/App -I../USB_HOST/Target -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-RefLibs-2f-src-2f-FastMathFunctions

clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-RefLibs-2f-src-2f-FastMathFunctions:
	-$(RM) ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/cos.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/cos.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/cos.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/cos.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sin.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sin.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sin.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sin.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sqrt.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sqrt.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sqrt.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/FastMathFunctions/sqrt.su

.PHONY: clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-RefLibs-2f-src-2f-FastMathFunctions

