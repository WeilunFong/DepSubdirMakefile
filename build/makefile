###########################################################################
# Copyright (c) 2019 ZHISHAN-IoT
# 
# file    : makefile
# author  : Weilun Fong
# brief   : makefile for dep-subdir-compile
# encoding: utf-8
# note    : show how to compile sub-directories which exist dependency
###########################################################################

###########################################################
##### [1] ENVIRONMENT CONFIG
###########################################################
### run-time environment
export SHELL      := /bin/bash
### shell command
export BASENAME   := basename
export CAT        := cat
export CD         := cd
export ECHO       := echo
export EECHO      := echo -e
export GREP       := grep
export LS         := ls
###########################################################
# cover Linux Shell environment varibale "PWD"
export PWD        := pwd
###########################################################
export RM         := rm -f
export XARGS      := xargs
### toolchain
export CC         ?= gcc
export MAKE       := gmake

###########################################################
##### [2] PATH DEFINE
###########################################################
### basic path
export PATH_BUILD   := $(CURDIR)
export PATH_ROOT    := $(shell $(CD) $(PATH_BUILD)/.. && $(PWD))
### function path
export PATH_CODE    := $(PATH_ROOT)/code
export PATH_OBJ     := $(PATH_ROOT)/obj

###########################################################
##### [3] DIRECTORY LIST DEFINE
DIR_DEP_LIST := dep
DIR_NOR_LIST := $(subst inc, , $(subst $(DIR_DEP_LIST), , $(notdir $(wildcard $(PATH_CODE)/*))))
###########################################################

###########################################################
##### [4] "all" TARGET
all: $(DIR_NOR_LIST)
###########################################################

###########################################################
##### [5] DEPENDENCY DIRECTORY COMPILE
###########################################################
.PHONY: depdir $(DIR_DEP_LIST)
###########################################################
depdir: $(DIR_DEP_LIST)
###########################################################
$(DIR_DEP_LIST):
	@$(EECHO) "\033[1;36m- Compile directory $@ \033[0m"
	@$(MAKE) -s -C $(PATH_CODE)/$@

###########################################################
##### [6] NORMAL DIRECTORY COMPILE
###########################################################
.PHONY: subdir $(DIR_NOR_LIST)
###########################################################
subddir: $(DIR_NOR_LIST)
###########################################################
$(DIR_NOR_LIST): depdir
	@$(EECHO) "\033[1;36m- Compile directory $@ \033[0m"
	@$(MAKE) -s -C $(PATH_CODE)/$@

###########################################################
##### [+] CLEAN OPERATION
###########################################################
.PHONY: clean
clean:
	$(CD) $(PATH_OBJ) && $(LS) | $(GREP) -v ".gitkeep" | $(XARGS) $(RM)

###########################################################
##### [+] HELP INFORMATION
###########################################################
.PHONY: help
help:
sinclude $(PATH_BUILD)/makefile.help

###########################################################
##### [+] REBUILD WORKS
###########################################################
.PHONY: rebuild
rebuild:
	@$(EECHO) "\033[1;36m- Clean all target files \033[0m"
	@$(MAKE) -s clean
	@$(EECHO) "\033[1;36m- Start rebuild works \033[0m"
	@$(MAKE) -s -j$(JOBS)

###########################################################
##### [+] VERSION INFORMATION
###########################################################
.PHONY: version
version:
sinclude $(PATH_BUILD)/makefile.version
