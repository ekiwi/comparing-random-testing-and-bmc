# Licensed under the Apache License, Version 2.0 (the "License");
# Copyright 2020 Google LLC
# Copyright 2022 The Regents of the University of California

VERILATOR_ROOT ?= /usr/share/verilator
MK_AFL_DIR ?= /please/specify
TOPLEVEL = Vtop

# location of the model
MODEL_DIR = verilated
BUILD_DIR = $(MODEL_DIR)

# instrument only the C++ model
DUT_CXX = $(MK_AFL_DIR)/afl-clang-fast++
VLTRT_CXX = clang++
LINK = $(MK_AFL_DIR)/afl-clang-fast++


include $(MODEL_DIR)/Vtop_classes.mk

# Compiler flags to use to turn off unused and generated code warnings,
# such as -Wno-div-by-zero
CFG_CXXFLAGS_NO_UNUSED = \
	-Wno-sign-compare \
	-Wno-uninitialized \
	-Wno-unused-parameter \
	-Wno-unused-variable \
	-Wno-shadow

CPPFLAGS += \
	-I/src \
	-I$(MODEL_DIR) \
	-I$(VERILATOR_ROOT)/include \
	-I$(VERILATOR_ROOT)/include/vltstd \
	-DVM_COVERAGE=$(VM_COVERAGE) \
	-DVM_TRACE=$(VM_TRACE) \
	-O3 \
	$(CFG_CXXFLAGS_NO_UNUSED)


################################################################################
# DUT/Verilator-Runtime/Testbench classes
################################################################################
DUT_CLASSES += $(VM_CLASSES_FAST) \
		$(VM_CLASSES_SLOW) \
		$(VM_SUPPORT_FAST) \
		$(VM_SUPPORT_SLOW)
VLTRT_CLASSES += $(VM_GLOBAL_FAST) \
		$(VM_GLOBAL_SLOW)
								 

DUT_OBJS    = $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(DUT_CLASSES)))
VLTRT_OBJS  = $(addprefix $(BUILD_DIR)/, $(addsuffix .o, $(VLTRT_CLASSES)))
ALL_OBJS    = $(DUT_OBJS) $(VLTRT_OBJS) $(BUILD_DIR)/top.o


################################################################################
# Linking rules
################################################################################
$(BUILD_DIR)/$(TOPLEVEL): $(ALL_OBJS)
	$(LINK) $(LDFLAGS) $^ $(LDLIBS) -o $@
				 
################################################################################
# Compilation rules
################################################################################
# DUT Model
$(DUT_OBJS): $(BUILD_DIR)/%.o: $(MODEL_DIR)/%.cpp
	$(DUT_CXX) $(DUT_CXXFLAGS) $(CPPFLAGS) $(DUT_OPT) -c -o $@ $<

# testbench (compile with instrumentation in order to enable persistent mode)
$(BUILD_DIR)/top.o: top.cpp
	$(DUT_CXX) $(DUT_CXXFLAGS) $(CPPFLAGS) $(DUT_OPT) -c -o $@ $<

# Verilator runtime code (don't want to instrument this when fuzzing)
$(VLTRT_OBJS): $(BUILD_DIR)/%.o: $(VERILATOR_ROOT)/include/%.cpp
	$(VLTRT_CXX) $(VLTRT_CXXFLAGS) $(CPPFLAGS) $(VLTRT_OPT) -c -o $@ $<
