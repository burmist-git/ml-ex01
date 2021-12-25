
########################################################################
#                                                                      #
# Copyright(C) 2020 - LBS - (Single person developer.)                 #
# Tue Mar 24 11:27:47 CET 2020                                         #
# Autor: Leonid Burmistrov                                             #
#                                                                      #
# Script description:                                                  #
#                                                                      #
# Input paramete:                                                      #
#                                                                      #
# This software is provided "as is" without any warranty.              #
########################################################################

MakefileFullPath = $(abspath $(lastword $(MAKEFILE_LIST)))
MakefileDirFullPath = $(shell dirname $(MakefileFullPath))

ROOTCFLAGS  = $(shell $(ROOTSYS)/bin/root-config --cflags)
ROOTLIBS    = $(shell $(ROOTSYS)/bin/root-config --libs)
ROOTGLIBS   = $(shell $(ROOTSYS)/bin/root-config --glibs)
ROOTLDFLAGS = $(shell $(ROOTSYS)/bin/root-config --ldflags)

CXX  = g++
CXX += -I./

CXXFLAGS  = -g -Wall -fPIC -Wno-deprecated
CXXFLAGS += $(ROOTCFLAGS)
CXXFLAGS += $(ROOTLIBS)
CXXFLAGS += $(ROOTGLIBS)
CXXFLAGS += $(ROOTLDFLAGS)
CXXFLAGS += $(LIB_push_vector_in_root)

.PHONY: all printmakeinfo clean 

#----------------------------------------------------#

all: memory_vec_test

printmakeinfo:
	$(info CXX                 = "$(CXX)")
	$(info CXXFLAGS            = "$(CXXFLAGS)")
	$(info MakefileFullPath    = "$(MakefileFullPath)")
	$(info MakefileDirFullPath = "$(MakefileDirFullPath)")

memory_vec_test: memory_vec_test.cc
	$(CXX) -o $@ $< $(CXXFLAGS)

clean:
	rm -f *~
	rm -f .*~
	rm -f memory_vec_test
