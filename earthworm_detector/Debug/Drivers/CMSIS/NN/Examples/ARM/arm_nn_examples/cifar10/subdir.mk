################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/arm_nnexamples_cifar10.cpp 

OBJS += \
./Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/arm_nnexamples_cifar10.o 

CPP_DEPS += \
./Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/arm_nnexamples_cifar10.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/%.o Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/%.su Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/%.cyclo: ../Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/%.cpp Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m7 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F746xx -c -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../TouchGFX/App -I../TouchGFX/target/generated -I../TouchGFX/target -I../USB_HOST/App -I../USB_HOST/Target -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1 -I../Middlewares/Third_Party/FatFs/src -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-NN-2f-Examples-2f-ARM-2f-arm_nn_examples-2f-cifar10

clean-Drivers-2f-CMSIS-2f-NN-2f-Examples-2f-ARM-2f-arm_nn_examples-2f-cifar10:
	-$(RM) ./Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/arm_nnexamples_cifar10.cyclo ./Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/arm_nnexamples_cifar10.d ./Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/arm_nnexamples_cifar10.o ./Drivers/CMSIS/NN/Examples/ARM/arm_nn_examples/cifar10/arm_nnexamples_cifar10.su

.PHONY: clean-Drivers-2f-CMSIS-2f-NN-2f-Examples-2f-ARM-2f-arm_nn_examples-2f-cifar10

