########################################################################
#                                                                      #
# Copyright(C) 2020 - LBS - (Single person developer.)                 #
# Mon May  4 03:39:44 CEST 2020                                        #
# Autor: Leonid Burmistrov                                             #
#                                                                      #
# Script description:                                                  #
#                                                                      #
# Input paramete: NON                                                  #
#                                                                      #
# This software is provided "as is" without any warranty.              #
########################################################################

ROOTCFLAGS    = $(shell $(ROOTSYS)/bin/root-config --cflags)
ROOTLIBS      = $(shell $(ROOTSYS)/bin/root-config --libs)
ROOTGLIBS     = $(shell $(ROOTSYS)/bin/root-config --glibs)

CXX  = g++
CXX += -I./     

CXXFLAGS  = -g -Wall -fPIC -Wno-deprecated
CXXFLAGS += $(ROOTCFLAGS)
CXXFLAGS += $(ROOTLIBS)
CXXFLAGS += $(ROOTGLIBS)
CXXFLAGSDICT = -g -Wall -fPIC -Wno-deprecated

#----------------------------------------------------#

operator2D: operator2D.cc
	$(CXX) -o $@ $< $(CXXFLAGS)

clean:
	rm -f *~
	rm -f .*~
	rm -f operator2D
