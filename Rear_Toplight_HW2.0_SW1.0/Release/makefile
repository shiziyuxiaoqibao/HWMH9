################################################################################
# 自动生成的文件。不要编辑！
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include objects.mk

-include $(C_DEPS)

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# 所有目标
all: Rear_Toplight_HW2.0_SW1.0.hex

# 工具调用
Rear_Toplight_HW2.0_SW1.0.hex: $(OBJS) $(USER_RELS)
	@echo 'Building target: $@'
	@echo 'Invoking: C Project Linker Release'
	kf8link -O3 -c -m libkf8v2.lib KF8A100ENG.lib KF8_Touch_Fun.lib ../kf8a100_touch_driver.o -s"C:/ChipONCC/kfl/KF8A100ENG.kfl" -o "Rear_Toplight_HW2.0_SW1.0.hex" $(OBJS) $(USER_RELS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# 其他目标
clean:
	-$(RM) $(OBJS)$(EXECUTABLES)$(C_DEPS) Rear_Toplight_HW2.0_SW1.0.hex
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
