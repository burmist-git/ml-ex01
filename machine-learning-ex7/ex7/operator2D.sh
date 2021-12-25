#!/bin/bash

########################################################################
#                                                                      #
# Copyright(C) 2020 - LBS - (Single person developer.)                 #
# Mon May  4 12:42:45 CEST 2020                                        #
# Autor: Leonid Burmistrov                                             #
#                                                                      #
# File description:                                                    #
#                                                                      #
# Input paramete:                                                      #
#                                                                      #
# This software is provided "as is" without any warranty.              #
#                                                                      #
########################################################################

function operator2D_sh {
    rm hist.root
    make clean; make; ./operator2D 1000000; root -l plots.C
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -d  : default"
    echo " -p2 : second parameter"
}

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-d" ]; then
	operator2D_sh
    elif [ "$1" = "-p2" ]; then
	echo " $1 "
    else
        printHelp
    fi
fi
