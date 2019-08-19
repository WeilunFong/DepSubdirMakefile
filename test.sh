#!/bin/bash

###########################################################################
# Copyright (c) 2019 ZHISHAN-IoT
# 
# file    : test.sh
# author  : Weilun Fong
# brief   : Linux Shell script for test
# encoding: utf-8
# note    : 
###########################################################################

###########################################################
##### [*] get script name
SCRIPT_FULL_NAME=$0
SCRIPT_NAME=`echo $SCRIPT_FULL_NAME | awk -F '/' '{print $NF}'`
PROJECT_NAME=DepSubdirMakefile
###########################################################

###########################################################
##### [*] mark shell command parameter
HEDADER_INFO_ERROR="\033[31m error\033[0m"
getoptrule="getopt -a -o chvp: --long clean,parallel:,help,version -- "
###########################################################

###########################################################
##### [*] function define
###########################################################
### clean operation function
function app_clean {
    make clean -C $PATH_BUILD -j$parallel
    exit 0
}

### parameter handle function
function app_handle_parameter {

    getoptres="`eval "$getoptrule" "$@"`"
    eval set -- "$getoptres"

    while true
    do
        case "$1" in
            # clean
            -c|--clean)
                app_clean
            ;;
            # help
            -h|--help)
                app_show_help_information
            ;;
            # parallel
            -p|--parallel)
                export parallel="$2"
                shift 2
            ;;
            # version
            -v|--version)
                app_show_version_information
            ;;
            # non
            --)
                break
                shift
            ;;
        esac
    done

    ### fill with default value
    if [ -z "$parallel" ]; then
        export parallel=1
    fi
}

### show help information function
function app_show_help_information {
    echo "[$SCRIPT_NAME] Test script for $PROJECT_NAME"
    echo "Usage:"
    echo "    $SCRIPT_FULL_NAME [OPTION]"
    echo ""
    echo "Function options:"
    echo "    -c, --clean                     clean operation"
    echo "    -p, --parallel=n                the value will pass to \"make -j\""
    echo "Info options:"
    echo "    -h, --help                      show help information"
    echo "    -v, --version                   show version information"
    echo ""
    echo "Examples:"
    echo "  exam1: $SCRIPT_FULL_NAME"
    echo "  exam2: $SCRIPT_FULL_NAME --parallel=8"
    echo "  exam3: $SCRIPT_FULL_NAME -c"
    exit 0
}

### show version information function
function app_show_version_information {
    echo "[$SCRIPT_NAME] Test script for $PROJECT_NAME `cat VERSION`"
    echo "Copyright (C) 2019 ZHISHAN-IoT, all rights reserved."
    echo "a one-key test script."
    echo ""
    echo "Created by:"
    echo -e "    Weilun Fong  \t wlf@zhishan-iot.tk"
    exit 0
}

###########################################################
##### [1] init works
###########################################################
PATH_ROOT="`pwd`"
    PATH_BUILD=$PATH_ROOT/build
    if [ ! -d "$PATH_BUILD" ]; then
        echo -e "$SCRIPT_FULL_NAME:$LINENO: $HEDADER_INFO_ERROR: can't find directory $PATH_BUILD" && exit 1
    fi
    PATH_OBJ=$PATH_ROOT/obj
###########################################################
### handle parameter
app_handle_parameter $*

###########################################################
##### [2] start to build
###########################################################
make rebuild -s -C $PATH_BUILD JOBS=$parallel

###########################################################
##### [3] execute target file
###########################################################
cd $PATH_OBJ
export LD_LIBRARY_PATH="$PATH_OBJ:$LD_LIBRARY_PATH"
###########################################################
echo "=================================================="
./dir1
./dir2
cd - > /dev/null
