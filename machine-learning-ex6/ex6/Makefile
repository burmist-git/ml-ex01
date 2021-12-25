########################################################################
#                                                                      #
# Copyright(C) 2020 - LBS - (Single person developer.)                 #
# Tue Apr 28 01:16:58 CEST 2020                                        #
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

# add xml files
# ROOTLIBS += -lMLP -lXMLIO

# OUTLIB = ./obj/
CXX  = g++
CXX += -I./     

CXXFLAGS  = -g -Wall -fPIC -Wno-deprecated
CXXFLAGS += $(ROOTCFLAGS)
CXXFLAGS += $(ROOTLIBS)
CXXFLAGS += $(ROOTGLIBS)
CXXFLAGSDICT = -g -Wall -fPIC -Wno-deprecated

# PATHTOSHAREDLIB=$(OUTLIB)

#----------------------------------------------------#

convert_emails: convert_emails.cc
	$(CXX) -o $@ $< $(CXXFLAGS)

clean:
	rm -f *~
	rm -f .*~
	rm -f convert_emails
