###########################################################################
# Copyright (c) 2019 ZHISHAN-IoT
# 
# file    : makefile
# author  : Weilun Fong
# brief   : general purpose makefile for building process file
# encoding: utf-8
# note    : 
###########################################################################

###########################################################
##### [1] ADJUST PARAMTERS
###########################################################
### generate target process file name
EXEFILES := $(addprefix $(PATH_OBJ)/, $(subst .c, ,$(notdir $(CFILES))))
###########################################################
### adjust CFLAGS
CFLAGS   += $(addprefix -l, $(NEEDED_LIBS))

###########################################################
##### [2] BUILD WORKS
###########################################################
$(CUR_DIR_TAR): $(EXEFILES)
###########################################################
$(EXEFILES): $(PATH_OBJ)/%:$(CURDIR)/src/%.c
	@$(ECHO) "CC  $<"
	@$(CC) $< $(CFLAGS) -o $(PATH_OBJ)/"`$(BASENAME) $< .c`"
###########################################################
