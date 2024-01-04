################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../kf8a100_touch_driver.o 

C_SRCS += \
../ADC.c \
../CTouch.c \
../Flash.c \
../Timer.c \
../config_set.c \
../init_mcu.c \
../key.c \
../led.c \
../main.c \
../pwm.c 

OBJS += \
./ADC.o \
./CTouch.o \
./Flash.o \
./Timer.o \
./config_set.o \
./init_mcu.o \
./key.o \
./led.o \
./main.o \
./pwm.o 

C_DEPS += \
./ADC.dep \
./ADC.d \
./CTouch.dep \
./CTouch.d \
./Flash.dep \
./Flash.d \
./Timer.dep \
./Timer.d \
./config_set.dep \
./config_set.d \
./init_mcu.dep \
./init_mcu.d \
./key.dep \
./key.d \
./led.dep \
./led.d \
./main.dep \
./main.d \
./pwm.dep \
./pwm.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: C Compiler'
	kf8cc -c --share -pkf8a100eng -I"D:\workspace\Rear_Toplight_HW2.0_SW1.0" -I"C:\ChipONCC\include" -I"C:\ChipONCC\include\chipon16" --array-optimize -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


