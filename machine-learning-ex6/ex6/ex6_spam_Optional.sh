#!/bin/bash

########################################################################
#                                                                      #
# Copyright(C) 2020 - LBS - (Single person developer.)                 #
# Sat Apr 25 21:27:57 CEST 2020                                        #
# Autor: Leonid Burmistrov                                             #
#                                                                      #
# File description:                                                    #
#                                                                      #
# Input paramete:                                                      #
#                                                                      #
# This software is provided "as is" without any warranty.              #
#                                                                      #
########################################################################

function ex6_spam_Optional_sh {
    echo "nFile     $nFile"
    echo "nJobs     $nJobs"
    echo "sleepTime $sleepTime"
    echo "vocTempl  $vocTempl"
    for i in `seq -f '%03g' 1 $nJobs` ; do
	i_min=$(echo "$nFile*($i-1)+1" | bc -l)
	i_max=$(echo "$nFile*$i" | bc -l)
	vocabMyfile="vocabMy$i.txt"
	cp $vocTempl $vocabMyfile
	cmd="octave --eval \"ex6_spam_Optional($i_min,$i_max,'$vocabMyfile')\""
	outBashsc='runVoc'$i'.sh'
	echo $cmd | tee $outBashsc
	chmod u+x $outBashsc
	screenName='scrV'$i
	screen -d -m -L -S $screenName ./$outBashsc
	sleep $sleepTime
	#source 'runVoc'$i'.sh'
    done
}

function buildVocabMyL_sh {
    octave --eval "buildVocabMyL()"
}

function mergeVoc01_sh {
    cp vocabMy001.txt vocabMymerg001.txt
    octave --eval "mergeVoc('vocabMy002.txt','vocabMymerg001.txt')"
}

function mergeVoc02_sh {
    cp vocabMy003.txt vocabMymerg002.txt
    octave --eval "mergeVoc('vocabMy004.txt','vocabMymerg002.txt')"
}

function mergeVoc03_sh {
    cp vocabMy005.txt vocabMymerg003.txt
    octave --eval "mergeVoc('vocabMy006.txt','vocabMymerg003.txt')"
}

function mergeVoc04_sh {
    cp vocabMy007.txt vocabMymerg004.txt
    octave --eval "mergeVoc('vocabMy008.txt','vocabMymerg004.txt')"
}

function mergeVoc001m_sh {
    cp vocabMymerg001.txt vocabMymerg001m.txt
    octave --eval "mergeVoc('vocabMymerg002.txt','vocabMymerg001m.txt')"
}

function mergeVoc002m_sh {
    cp vocabMymerg003.txt vocabMymerg002m.txt 
    octave --eval "mergeVoc('vocabMymerg004.txt','vocabMymerg002m.txt')"
}

function mergeVoc_sh {
    screen -d -m -L -S screen01 ./ex6_spam_Optional.sh -merg01
    screen -d -m -L -S screen02 ./ex6_spam_Optional.sh -merg02
    screen -d -m -L -S screen03 ./ex6_spam_Optional.sh -merg03
    screen -d -m -L -S screen04 ./ex6_spam_Optional.sh -merg04
}

function mergeVocM_sh {
    screen -d -m -L -S screen01 ./ex6_spam_Optional.sh -merg01m
    screen -d -m -L -S screen02 ./ex6_spam_Optional.sh -merg02m
}

function mergeVocMM_sh {
    cp vocabMymerg001m.txt vocabMymerg_final.txt  
    octave --eval "mergeVoc('vocabMymerg002m.txt','vocabMymerg_final.txt')"
}

function sortVocabMy_sh {
    #octave --eval "sortVocabMy('vocabMy001.txt','vocabMy001_sort.txt')"
    octave --eval "sortVocabMy('vocabMymerg_final.txt','vocabMymerg_final_sort.txt')"
}

function creatDataSet_sh() {
    nn=`more ./data/easy_ham/easy_ham.p1.list_xy.dat | wc -l`; #echo $nn; nn=1
    time octave --eval "creatDataSet( './data/easy_ham/easy_ham.p1.list_xy.dat', 'vocabMymerg_final_sort_short.txt', $nn)"
    mv out_mat_file.mat ./data/easy_ham/easy_ham.mat
    nn=`more ./data/easy_ham_2/easy_ham_2.p1.list_xy.dat | wc -l`; #echo $nn; nn=1
    time octave --eval "creatDataSet( './data/easy_ham_2/easy_ham_2.p1.list_xy.dat', 'vocabMymerg_final_sort_short.txt', $nn)"
    mv out_mat_file.mat ./data/easy_ham_2/easy_ham_2.mat
    nn=`more ./data/hard_ham/hard_ham.p1.list_xy.dat | wc -l`; #echo $nn; nn=1
    time octave --eval "creatDataSet( './data/hard_ham/hard_ham.p1.list_xy.dat', 'vocabMymerg_final_sort_short.txt', $nn)"
    mv out_mat_file.mat ./data/hard_ham/hard_ham.mat
    nn=`more ./data/spam/spam.p1.list_xy.dat | wc -l`; #echo $nn; nn=1
    time octave --eval "creatDataSet( './data/spam/spam.p1.list_xy.dat', 'vocabMymerg_final_sort_short.txt', $nn)"
    mv out_mat_file.mat ./data/spam/spam.mat
    nn=`more ./data/spam_2/spam_2.p1.list_xy.dat | wc -l`; #echo $nn; nn=1
    time octave --eval "creatDataSet( './data/spam_2/spam_2.p1.list_xy.dat', 'vocabMymerg_final_sort_short.txt', $nn)"
    mv out_mat_file.mat ./data/spam_2/spam_2.mat
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -d       : simple"
    echo " -voc     : scrabs the words from files"
    echo " -s       : sort vocabulary"
    echo " -cd      : creat data set"
    echo " -merg    : merge vocabulary"
    echo " -mergM   : merge vocabulary step2"
    echo " -mergMM  : merge vocabulary final"
    echo " -merg01  : merge vocabulary 01"
    echo " -merg02  : merge vocabulary 02"
    echo " -merg03  : merge vocabulary 03"
    echo " -merg04  : merge vocabulary 04"
    echo " -merg01m : merge vocabulary 01m"
    echo " -merg02m : merge vocabulary 02m"
    echo " -p2      : second parameter"
}

nFile=1100
nJobs=8
sleepTime=60
vocTempl='inTemplate_vocabMy.txt';

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-d" ]; then
	buildVocabMyL_sh
    elif [ "$1" = "-voc" ]; then
	ex6_spam_Optional_sh
    elif [ "$1" = "-s" ]; then
	sortVocabMy_sh
    elif [ "$1" = "-cd" ]; then
	creatDataSet_sh
    elif [ "$1" = "-merg" ]; then
	mergeVoc_sh
    elif [ "$1" = "-mergM" ]; then
	mergeVocM_sh
    elif [ "$1" = "-merg01" ]; then
	mergeVoc01_sh
    elif [ "$1" = "-merg02" ]; then
	mergeVoc02_sh
    elif [ "$1" = "-merg03" ]; then
	mergeVoc03_sh
    elif [ "$1" = "-merg04" ]; then
	mergeVoc04_sh
    elif [ "$1" = "-merg01m" ]; then
	mergeVoc001m_sh
    elif [ "$1" = "-merg02m" ]; then
	mergeVoc002m_sh
    elif [ "$1" = "-mergMM" ]; then
	mergeVocMM_sh
    elif [ "$1" = "-p2" ]; then
	echo " $1 "
    else
	printHelp
    fi
fi
