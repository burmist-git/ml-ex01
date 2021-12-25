#!/bin/bash

########################################################################
#                                                                      #
# Copyright(C) 2020 - LBS - (Single person developer.)                 #
# Wed Feb 19 13:35:58 CET 2020                                         #
# Autor: Leonid Burmistrov                                             #
#                                                                      #
# File description:                                                    #
#                  This script setup Octave of different vertions.     #
#                                                                      #
# Input paramete:                                                      #
#                   NON (to print the help).                           #
#                                                                      #
# This software is provided "as is" without any warranty.              #
#                                                                      #
########################################################################

function setupOctave_5_1_sh {
    sudo rm -rf /usr/bin/octave
    sudo rm -rf /usr/bin/octave-cli
    sudo rm -rf /usr/bin/octave-config
    sudo rm -rf /usr/bin/mkoctfile
    opf='/home/burmist/octave-5.1.0/octave-5.1.0-install/bin/'
    sudo ln -s $opf/octave /usr/bin/octave
    sudo ln -s $opf/octave-cli /usr/bin/octave-cli
    sudo ln -s $opf/octave-config /usr/bin/octave-config
    sudo ln -s $opf/mkoctfile /usr/bin/mkoctfile
}

function setupOctave_4_0_sh {
    sudo cp $sourceHome/octave_bin_arch/octave_4.0.0 /usr/bin/octave
    sudo cp $sourceHome/octave_bin_arch/octave-cli_4.0.0 /usr/bin/octave-cli
    sudo cp $sourceHome/octave_bin_arch/octave-config_4.0.0 /usr/bin/octave-config
    sudo cp $sourceHome/octave_bin_arch/mkoctfile_4.0.0 /usr/bin/mkoctfile
}

function setupOctave_4_4_1_sh {
    sudo rm -rf /usr/bin/octave
    sudo rm -rf /usr/bin/octave-cli
    sudo rm -rf /usr/bin/octave-config
    sudo rm -rf /usr/bin/mkoctfile
    opf='/home/burmist/octave-4.4.1/octave-4.4.1-install/bin/'
    sudo ln -s $opf/octave /usr/bin/octave
    sudo ln -s $opf/octave-cli /usr/bin/octave-cli
    sudo ln -s $opf/octave-config /usr/bin/octave-config
    sudo ln -s $opf/mkoctfile /usr/bin/mkoctfile
}

function getOctaveVersion {
    octave --version | grep GNU
    ls -lrt /usr/bin/octave*
    ls -lrt /usr/bin/mkoct*
}

function installLibsForOctave {
    #
    sudo apt-get install libcurl-dev
    sudo apt-get install libcurl4-nss-dev 
    sudo apt-get install libcurl4-openssl-dev 
    sudo apt-get install libcurl4-gnutls-dev 
    sudo apt-get install libcurl4-doc 
    sudo apt-get install libcurl-ocaml
    sudo apt-get install libcurl-ocaml-dev 
    sudo apt-get install libcurlpp0 
    sudo apt-get install libcurlpp-dev 
    sudo apt-get install libqhull-dev 
    sudo apt-get install libqhull-doc 
    sudo apt-get install libqhull7 
    sudo apt-get install libglpk36
    sudo apt-get install libglpk36-dbg 
    sudo apt-get install libglpk-dev 
    sudo apt-get install libglpk-java 
    sudo apt-get install libbz2-1.0 
    sudo apt-get install libbz2-ocaml
    sudo apt-get install libbz2-ocaml-dev 
    sudo apt-get install libbz2-dev 
    sudo apt-get install bzip2
    sudo apt-get install bzip2-doc
    #
    sudo apt-get install graphicsmagick
    sudo apt install gperf
    sudo apt install flex
    sudo apt install librsvg2-*
    sudo apt install sndfile-*
    sudo apt install qt5-default 
    sudo apt install qt5-doc
    sudo apt install qt5ct 
    sudo apt install qt5gstreamer-dbg 
    sudo apt install qt5-image-formats-plugins 
    sudo apt install qt5keychain-dev 
    sudo apt install qt5-qmake
    sudo apt install qt5-qmake-arm-linux-gnueabihf 
    sudo apt install qt5-qmake-gles 
    sudo apt install qt5-style-plugins 
    sudo apt install libsndfile1*
    sudo apt-get install libportaudiocpp0 
    sudo apt-get install libportaudio-ocaml
    sudo apt-get install libportaudio-ocaml-dev 
    #    
    #sudo apt-get install libqscintilla*
    #sudo apt install qt4-*
    #sudo apt install qt5tools
    #
    sudo apt install libosmesa6*
    sudo apt install libfltk1.3*
    sudo apt-get install libsundials-*
}

function printHELP {
    echo " --> ERROR in input arguments "
    echo " -d     : Default"
    echo " -5.1   : Setup Octave 5.1.0 To launch Octave with GUI : octave --gui"
    echo " -4.0   : Setup Octave 4.0.0 To launch Octave with GUI : octave"
    echo " -4.4.1 : Setup Octave 4.4.1 To launch Octave with GUI : octave --gui"
    echo " -v     : Get Octave version"
    echo " -i     : Install libs for octave"    
    echo " -h     : Print help"
}

sourceHome=$(dirname $(realpath ${BASH_SOURCE[0]}))

if [ $# -eq 0 ];
then
    printHELP
else
    if [ $1 == "-5.1" ]; then
	setupOctave_5_1_sh
	getOctaveVersion
    elif [ $1 == "-d" ]; then
	setupOctave_4_0_sh
	getOctaveVersion
    elif [ $1 == "-4.0" ]; then
	setupOctave_4_0_sh
	getOctaveVersion
    elif [ $1 == "-4.4.1" ]; then
	setupOctave_4_4_1_sh
	getOctaveVersion
    elif [ $1 == "-v" ]; then
	getOctaveVersion
    elif [ $1 == "-i" ]; then
	installLibsForOctave 
    elif [ $1 == "-h" ]; then
	printHELP
    else
	printHELP
    fi
fi
