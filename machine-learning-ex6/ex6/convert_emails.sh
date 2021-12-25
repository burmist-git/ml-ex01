#!/bin/bash

########################################################################
#                                                                      #
# Copyright(C) 2020 - LBS - (Single person developer.)                 #
# Tue Apr 28 02:31:38 CEST 2020                                        #
# Autor: Leonid Burmistrov                                             #
#                                                                      #
# File description:                                                    #
#                                                                      #
# Input paramete:                                                      #
#                                                                      #
# This software is provided "as is" without any warranty.              #
#                                                                      #
########################################################################

function convert_emails_sh {
    make clean; make;
    j=0
    for i in "${dirNameArr[@]}" ; do
	file_i=/home/burmist/home2/coursera/machine-learning/ml_ex01/machine-learning-ex6/ex6/data/$i/$i.p1.list
	yy=${yArr[$j]}
	echo "$file_i $yy"
	outF=$file_i'_xy.dat'
	#echo "source /home/burmist/root_v6.14.00/root-6.14.00-install/bin/thisroot.sh" | tee 'runscFFF_'$j'.sh'
	echo "date" | tee 'runscFFF_'$j'.sh'
	echo "cd /home/burmist/home2/coursera/machine-learning/ml_ex01/machine-learning-ex6/ex6/" | tee -a 'runscFFF_'$j'.sh'
	#echo "make clean; make;" | tee -a 'runscFFF_'$j'.sh'
	echo "/home/burmist/home2/coursera/machine-learning/ml_ex01/machine-learning-ex6/ex6/convert_emails /home/burmist/home2/coursera/machine-learning/ml_ex01/machine-learning-ex6/ex6/vocabMymerg_final_sort_short.txt $file_i $yy $outF" | tee -a 'runscFFF_'$j'.sh'
	chmod u+x 'runscFFF_'$j'.sh'
	screen -d -m -L -S "screen0$j" "/home/burmist/home2/coursera/machine-learning/ml_ex01/machine-learning-ex6/ex6/runscFFF_$j.sh"
	let j=j+1
    done
    #screen -d -m -L -S 'screen01' "/home/burmist/home2/coursera/machine-learning/ml_ex01/machine-learning-ex6/ex6/runscFFF_0.sh"
}

dirNameArr=(
    easy_ham
    easy_ham_2
    hard_ham
    spam
    spam_2
)

yArr=(
    0
    0
    0
    1
    1
)

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -d       : simple"
    echo " -p2      : second parameter"
}

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-d" ]; then
	convert_emails_sh
    elif [ "$1" = "-p2" ]; then
	echo " $1 "
    else
	printHelp
    fi
fi

