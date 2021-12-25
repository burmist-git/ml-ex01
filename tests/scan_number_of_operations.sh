#!/bin/bash

########################################################################
#                                                                      #
# Copyright(C) 2020 - LBS - (Single person developer.)                 #
# Wed Apr 22 01:09:36 CEST 2020                                        #
# Autor: Leonid Burmistrov                                             #
#                                                                      #
# File description:                                                    #
#                                                                      #
# Input paramete:                                                      #
#                                                                      #
# This software is provided "as is" without any warranty.              #
#                                                                      #
########################################################################

function scan_number_of_operations_matrix_sh {
    #echo "scan_number_of_operations_ampl_sh"
    #logOut='scan_number_of_operations_ampl.dat'
    logOut=$1
    cmd=$2
    echo "logOut = $logOut"
    echo "cmd    = $cmd"
    rm -rf $logOut
    #rm -rf otaveTest.mat; time octave -q --eval "n = 600; m=1000000; A=rand(n,m); B=rand(m,n); C=A*B; save -mat octaveTest.mat C";
    #octave -q --eval "load('octaveTest.mat'); size(C);"; du -hs octaveTest.mat;
    #for i in 100 200 300 400; do
    #for i in 100 200 300 400 500 600 700 800 900; do
    #for i in 5750 6000 6050 6100 6150; do
    for i in 100 200 300 400 500 600 700 800 900 1000 1200 1400 1600 1800 2000 2500 3000 3500 4000 4500 5000 5500 5750 6000 6050 6100 6150; do
	runtimestr=""
	for j in `seq 0 4`; do
	#for j in `seq 1 20`; do
	    n=$i;
	    start=`date +%s%N`
	    octave -q --eval "n = $n; A=rand($n,$n); B=rand($n,$n); $cmd"
	    end=`date +%s%N`
	    runtime_ns=$((end-start))
	    sns=1000000000.0
	    runtime=$(echo "$runtime_ns/$sns" | bc -l)
	    runtimestr=$runtimestr" $runtime"
	done
	echo "$n $runtimestr" | tee -a $logOut
    done
}

function scan_number_of_operations_elementary_sh {
    #echo "scan_number_of_operations_elplus_sh"
    #logOut='scan_number_of_operations_elplus.dat'
    #logOut='scan_number_of_operations_elplus_norm.dat'
    logOut=$1
    cmd=$2
    echo "logOut = $logOut"
    echo "cmd    = $cmd"
    rm -rf $logOut
    #octave -q --eval "n = 6000; A=rand(n,n); B=rand(n,n); C = A+B;"
    for i in 100 200 400 800 1000 1500 2000 2500 3000 4000 5000 6000 7000 8000 9000 10000 12000 14000 16000 18000 20000 21000 22000 23000 23500; do
	runtimestr=""
	for j in `seq 0 4`; do
	    n=$i;
	    start=`date +%s%N`
	    octave -q --eval "A=rand($n,$n); B=rand($n,$n); $cmd"
	    #octave -q --eval "A=rand($n,$n); B=rand($n,$n);"
	    #$cmd
	    end=`date +%s%N`
	    runtime_ns=$((end-start))
	    sns=1000000000.0
	    runtime=$(echo "$runtime_ns/$sns" | bc -l)
	    runtimestr=$runtimestr" $runtime"
	done
	echo "$n $runtimestr" | tee -a $logOut
    done
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -d        : default"
    echo " -elnorm   : norm -> A=rand(n,n); B=rand(n,n)"
    echo " -elplus   : plus -> A+B"
    echo " -elmult   : plus -> A.*B"
    echo " -eldivi   : plus -> A./B"
    echo " -multnorm : norm -> A=rand(n,n); B=rand(n,n)"
    echo " -mult     : plus -> A*B"
    echo " -p2       : second parameter"
}

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-d" ]; then
	printHelp
    elif [ "$1" = "-elnorm" ]; then
	logOut='scan_number_of_operations_elnorm.dat'
	cmd=" ;"
	scan_number_of_operations_elementary_sh $logOut $cmd
    elif [ "$1" = "-elplus" ]; then
	logOut='scan_number_of_operations_elplus.dat'
	cmd="C=A+B;"
	scan_number_of_operations_elementary_sh $logOut $cmd
    elif [ "$1" = "-elmult" ]; then
	logOut='scan_number_of_operations_elmult.dat'
	cmd="C=A.*B;"
	scan_number_of_operations_elementary_sh $logOut $cmd
    elif [ "$1" = "-eldivi" ]; then
	logOut='scan_number_of_operations_eldivi.dat'
	cmd="C=A./B;"
	scan_number_of_operations_elementary_sh $logOut $cmd
    elif [ "$1" = "-multnorm" ]; then
	logOut='scan_number_of_operations_multnorm_small.dat'
	cmd=" ;"
	scan_number_of_operations_matrix_sh $logOut $cmd
    elif [ "$1" = "-mult" ]; then
	logOut='scan_number_of_operations_mult_small.dat'
	cmd="C=A*B;"
	scan_number_of_operations_matrix_sh $logOut $cmd
    elif [ "$1" = "-p2" ]; then
	echo " $1 "
    else
        printHelp
    fi
fi
