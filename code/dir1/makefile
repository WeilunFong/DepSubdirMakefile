###########################################################################
# Copyright (c) 2019 ZHISHAN-IoT
# 
# file    : makefile
# author  : Weilun Fong
# brief   : makefile for directory dir1
# encoding: utf-8
# note    : show how to compile sub-directories which exist dependency
###########################################################################

###########################################################
##### [1] COLLECT NEEDED PARAMETERS
###########################################################
CUR_DIR_TAR  := $(notdir $(CURDIR))
###########################################################
CFILES       := $(wildcard src/*.c)
###########################################################
NEEDED_LIBS  := dep

###########################################################
##### [2] COMPILE
include $(PATH_BUILD)/process.mk
###########################################################
