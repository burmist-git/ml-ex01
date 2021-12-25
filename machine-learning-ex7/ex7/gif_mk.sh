#!/bin/bash

########################################################################
#                                                                      #
# Copyright(C) 2020 - LBS - (Single person developer.)                 #
# Mon May  4 23:18:53 CEST 2020                                        #
# Autor: Leonid Burmistrov                                             #
#                                                                      #
# File description:                                                    #
#                                                                      #
# Input paramete:                                                      #
#                                                                      #
# This software is provided "as is" without any warranty.              #
#                                                                      #
########################################################################

function gif_mk_aa_sh {
    convert -delay $tdel -loop 0 fig01aa.png fig02aa.png aa.gif
    convert -delay $tdel -loop 0 aa.gif fig03aa.png aa.gif
    convert -delay $tdel -loop 0 aa.gif fig04aa.png aa.gif 
    convert -delay $tdel -loop 0 aa.gif fig05aa.png aa.gif
    convert -delay $tdel -loop 0 aa.gif fig06aa.png aa.gif 
    convert -delay $tdel -loop 0 aa.gif fig07aa.png aa.gif
    convert -delay $tdel -loop 0 aa.gif fig08aa.png aa.gif 
    convert -delay $tdel -loop 0 aa.gif fig09aa.png aa.gif
    convert -delay $tdel -loop 0 aa.gif fig10aa.png aa.gif
    convert -delay $tdel -loop 0 aa.gif fig11aa.png aa.gif
    convert -delay $tdel -loop 0 aa.gif fig12aa.png aa.gif 
}

function gif_mk_kk_sh {
    convert -delay $tdel -loop 0 fig01kk.png fig02kk.png kk.gif
    convert -delay $tdel -loop 0 kk.gif fig03kk.png kk.gif
    convert -delay $tdel -loop 0 kk.gif fig04kk.png kk.gif 
    convert -delay $tdel -loop 0 kk.gif fig05kk.png kk.gif
    convert -delay $tdel -loop 0 kk.gif fig06kk.png kk.gif 
    convert -delay $tdel -loop 0 kk.gif fig07kk.png kk.gif
    convert -delay $tdel -loop 0 kk.gif fig08kk.png kk.gif 
    convert -delay $tdel -loop 0 kk.gif fig09kk.png kk.gif
    convert -delay $tdel -loop 0 kk.gif fig10kk.png kk.gif
    convert -delay $tdel -loop 0 kk.gif fig11kk.png kk.gif
    convert -delay $tdel -loop 0 kk.gif fig12kk.png kk.gif 
}

function gif_mk_ll_sh {
    convert -delay $tdel -loop 0 fig01ll.png fig02ll.png ll.gif
    convert -delay $tdel -loop 0 ll.gif fig03ll.png ll.gif
    convert -delay $tdel -loop 0 ll.gif fig04ll.png ll.gif 
    convert -delay $tdel -loop 0 ll.gif fig05ll.png ll.gif
    convert -delay $tdel -loop 0 ll.gif fig06ll.png ll.gif 
    convert -delay $tdel -loop 0 ll.gif fig07ll.png ll.gif
    convert -delay $tdel -loop 0 ll.gif fig08ll.png ll.gif 
    convert -delay $tdel -loop 0 ll.gif fig09ll.png ll.gif
    convert -delay $tdel -loop 0 ll.gif fig10ll.png ll.gif
    convert -delay $tdel -loop 0 ll.gif fig11ll.png ll.gif
    convert -delay $tdel -loop 0 ll.gif fig12ll.png ll.gif 
}

function gif_mk_rr_sh {
    convert -delay $tdel -loop 0 fig01rr.png fig02rr.png rr.gif
    convert -delay $tdel -loop 0 rr.gif fig03rr.png rr.gif
    convert -delay $tdel -loop 0 rr.gif fig04rr.png rr.gif 
    convert -delay $tdel -loop 0 rr.gif fig05rr.png rr.gif
    convert -delay $tdel -loop 0 rr.gif fig06rr.png rr.gif 
    convert -delay $tdel -loop 0 rr.gif fig07rr.png rr.gif
    convert -delay $tdel -loop 0 rr.gif fig08rr.png rr.gif 
    convert -delay $tdel -loop 0 rr.gif fig09rr.png rr.gif
    convert -delay $tdel -loop 0 rr.gif fig10rr.png rr.gif
    convert -delay $tdel -loop 0 rr.gif fig11rr.png rr.gif
    convert -delay $tdel -loop 0 rr.gif fig12rr.png rr.gif 
}

function gif_mk_sh {
    rm fig.gif
    figID=1
    octave --eval "ex7_pca_aa_f($figID,5,1)"
    j=0
    for i in "${kArr[@]}" ; do
	echo $i
	octave --eval "ex7_pca_aa_f($figID,$i,0)"
        let j=j+1;
	if [ $j -eq 1 ] ; then
	    #echo "j = $j"
	    convert -delay $tdel -loop 0 figo.png fig.png fig.gif
	else
	    #echo "j = $j"
	    convert -delay $tdel -loop 0 fig.gif fig.png fig.gif
	fi       
    done
}

kArr1=(
    20
    10
)


kArr=(
    1000
    950
    900
    850
    800
    750
    700
    650
    600
    550
    500
    450
    400
    360
    330
    300
    260
    230
    200
    180
    160
    140
    120
    100
    90
    80
    70
    60
    50
    40
    30
    20
    10
)

tdel=50

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -d  : default"
    echo " -aa : aa"
    echo " -kk : kk"
    echo " -ll : ll"
    echo " -rr : rr"
    echo " -p2 : second parameter"
}

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-d" ]; then
	gif_mk_sh
    elif [ "$1" = "-aa" ]; then
	gif_mk_aa_sh
    elif [ "$1" = "-kk" ]; then
	gif_mk_kk_sh
    elif [ "$1" = "-ll" ]; then
	gif_mk_ll_sh
    elif [ "$1" = "-rr" ]; then
	gif_mk_rr_sh
    else
        printHelp
    fi
fi
