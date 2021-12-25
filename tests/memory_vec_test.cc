/***********************************************************************
* Copyright(C) 2020 - LBS - (Single person developer.)                 *
* Fri Apr 24 14:37:24 CEST 2020                                        *
* Autor: Leonid Burmistrov                                             *
***********************************************************************/

//c, c++
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <iomanip>
#include <time.h>
#include <vector>
#include <chrono>
#include <thread>

//root
#include <TROOT.h>
#include <TTree.h>
#include <TFile.h>
#include <TGraph.h>

int main(int argc, char *argv[]) {
  std::vector<double> v_d;
  std::vector<float> v_f;
  int n = atoi(argv[1]);
  int m = atoi(argv[2]);
  //ex1
  //std::cout<<atoi(argv[1])<<std::endl;
  //v_d.get_allocator().allocate(atoi(argv[1]));
  //v_d.assign(atoi(argv[1]),atoi(argv[2]));
  //std::this_thread::sleep_for(std::chrono::milliseconds(5000));
  //
  //ex2
  //for(int i = 0;i<n;i++){
  //v_d.push_back(m);
  //}
  //std::this_thread::sleep_for(std::chrono::milliseconds(5000));
  //
  //ex3
  //v_d.assign(n,m);
  //std::this_thread::sleep_for(std::chrono::milliseconds(5000));
  //v_f.assign(n,m);
  //std::this_thread::sleep_for(std::chrono::milliseconds(5000));
  //v_d.clear();
  //v_f.clear();
  //std::this_thread::sleep_for(std::chrono::milliseconds(5000));
  //
  //ex4
  double *a_arr;
  a_arr = new double[n];
  for(int i = 0;i<n;i++){
    a_arr[i] = m;
  }
  std::this_thread::sleep_for(std::chrono::milliseconds(5000));
  //std::cout<<a_arr[100]<<std::endl;
  //
  return 0;
}
