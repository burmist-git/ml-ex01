#!/bin/bash

########################################################################
#                                                                      #
# Copyright(C) 2020 - LBS - (Single person developer.)                 #
# Fri Apr 24 15:04:43 CEST 2020                                        #
# Autor: Leonid Burmistrov                                             #
#                                                                      #
# File description:                                                    #
#                                                                      #
# Input paramete:                                                      #
#                                                                      #
# This software is provided "as is" without any warranty.              #
#                                                                      #
########################################################################

function memory_vec_test_sh {
    #time ./memory_vec_test  1000000000 0;
    #time ./memory_vec_test 1410065408 0;
    #sleep 3
    #time ./memory_vec_test 1410065408 10;
    #sleep 3
    #time ./memory_vec_test 1410065408 100;
    #sleep 3
    #time ./memory_vec_test 1410065408 123123114;
    #time ./memory_vec_test  700065408 0;
    time ./memory_vec_test 1410065408 10065408;
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -d        : default"
    echo " -p2       : second parameter"
}

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-d" ]; then
	memory_vec_test_sh
    elif [ "$1" = "-p2" ]; then
	echo " $1 "
    else
        printHelp
    fi
fi
