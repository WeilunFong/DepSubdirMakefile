###########################################################################
# Copyright (c) 2019 ZHISHAN-IoT
# 
# file    : makefile
# author  : Weilun Fong
# brief   : makefile for directory dir2
# encoding: utf-8
# note    : show how to compile sub-directories which exist dependency
###########################################################################

###########################################################
##### [1] GENERATE TARGET
CUR_DIR_TAR  := $(notdir $(CURDIR))
###########################################################
CFILES       := $(wildcard src/*.c)
EXEFILES     := $(addprefix $(PATH_OBJ)/, $(subst .c, ,$(notdir $(CFILES))))
CFLAGS       := -I$(PATH_CODE)/inc -pipe -O2 -L$(PATH_OBJ) -ldep
###########################################################

###########################################################
##### [2] START TO COMPILE
###########################################################
$(CUR_DIR_TAR): $(EXEFILES)
###########################################################
$(EXEFILES): $(PATH_OBJ)/%:$(CURDIR)/src/%.c
	@$(ECHO) "CC  $<"
	@$(CC) $< $(CFLAGS) -o $(PATH_OBJ)/"`$(BASENAME) $< .c`"
###########################################################
