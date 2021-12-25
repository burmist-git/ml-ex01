/***********************************************************************
* Copyright(C) 2020 - LBS - (Single person developer.)                 *
* Tue Apr 28 01:20:17 CEST 2020                                        *
* Autor: Leonid Burmistrov                                             *
***********************************************************************/

//c, c++
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
#include <time.h>
#include <math.h>
#include <vector>

//root
#include <TVector2.h>
#include <TPolyLine.h>
#include <TLine.h>
#include <TCanvas.h>
#include <TGraph.h>
#include <TText.h>
#include <TMath.h>
#include <TH2F.h>
#include <TLegend.h>
#include <TCrown.h>
#include <TArc.h>
#include <TROOT.h>
#include <TRandom3.h>
#include <TStyle.h>
#include <TPad.h>
#include <TString.h>
#include <TFile.h>
#include <TAxis.h>
#include <TVector2.h>
#include <TImage.h>

using namespace std;

std::vector<std::string> read_v(TString vf);
std::vector<std::string> read_p1l(TString vf);
std::vector<std::vector<std::string>> read_e(std::vector<std::string> fl);

int main(int argc, char *argv[]){
  TString vf = argv[1];
  TString lf = argv[2];
  int y = atoi(argv[3]);
  TString of = argv[4];
  cout<<"vf = "<<vf<<endl
      <<"lf = "<<lf<<endl
      <<"y  = "<<y<<endl
      <<"of = "<<of<<endl;

  std::vector<std::string> v  = read_v(vf);
  std::vector<std::string> fl = read_p1l(lf);
  std::vector<std::vector<std::string>> e = read_e(fl);
  std::vector<std::vector<int>> x;
  std::vector<int> xx;
  std::cout<<std::endl;

  for(unsigned int i = 0;i<fl.size();i++){
    //std::cout<<"\r"<<setw(5)<<i+1<<"/"<<fl.size()<<std::flush;
    std::cout<<setw(5)<<i+1<<"/"<<fl.size()<<std::endl;
    //std::cout<<setw(5)<<i+1<<"/"<<fl.size()<<" "<<fl[i]<<" "<<setw(10)<<e[i].size()<<endl;
    xx.clear();
    xx.assign(v.size(),0);
    for(unsigned int j = 0;j<e[i].size();j++){
      for(unsigned int k = 0;k<v.size();k++){
	if(v[k]==e[i][j]){
	  xx[k]=1;
	  break;
	}
      }
      }
    x.push_back(xx);
  }
  ofstream myfile;
  myfile.open (of.Data());
  for(unsigned int i = 0;i<x.size();i++){
    myfile<<setw(2)<<y;
    for(unsigned int j = 0;j<x[i].size();j++)
      myfile<<setw(2)<<x[i][j];
    myfile<<endl;
  }
  myfile.close();

  cout<<"x[0].size() "<<x[0].size()<<endl
      <<"x.size()    "<<x.size()<<endl;
  TH2D *h2t = new TH2D("h2t","h2t",100,1,100,100,1,100);
  TH2D *h2 = new TH2D("h2","h2",x[0].size(),1,x[0].size(),x.size(),1,x.size());
  for(unsigned int i = 0;i<x.size();i++)
    for(unsigned int j = 0;j<x[i].size();j++)
      h2->SetBinContent(j,i,x[i][j]);

  for(unsigned int i = 0;i<100;i++)
    for(unsigned int j = 0;j<100;j++)
      h2t->Fill((Double_t)j,(Double_t)i);


  TString rootfOut = of;
  rootfOut +=".root";
  TFile* rootFile = new TFile(rootfOut.Data(), "RECREATE", " Histograms", 1);
  rootFile->cd();
  if (rootFile->IsZombie()){
    cout<<"  ERROR ---> file "<<rootfOut.Data()<<" is zombi"<<endl;
    assert(0);
  }
  else
    cout<<"  Output Histos file ---> "<<rootfOut.Data()<<endl;
  cout<<endl<<endl;

  h2->Write();
  h2t->Write();

  rootFile->Close();

  
  return 0;
}

std::vector<std::vector<std::string>> read_e(std::vector<std::string> fl) {
  std::vector<std::vector<std::string>> vv;
  string mot;
  for(unsigned int i = 0;i<fl.size();i++){
    //for(int i = 0;i<1;i++){
    ifstream infile (fl[i].c_str());
    if(infile.is_open()){
      std::vector<std::string> v;
      while( infile>> mot)
	v.push_back(mot);
      vv.push_back(v);
    }
    infile.close();
  }
  return vv;
}

std::vector<std::string> read_v(TString vf) {
  std::vector<std::string> v;
  string mot;
  int nn;
  ifstream infile (vf.Data());
  if(infile.is_open()){
    cout<<vf<<endl;
    while( infile>> nn >> mot >> nn){
      //cout<<mot<<endl;
      v.push_back(mot);
    }
  }
  infile.close();
  return v;
}

std::vector<std::string> read_p1l(TString vf) {
  std::vector<std::string> v;
  string mot;
  int l,w,c;
  ifstream infile (vf.Data());
  if(infile.is_open())
    while( infile>> mot >> l >> w >> c)
      if(w>0)
	if(w<1000)
	  if(c/w<15)
	    v.push_back(mot);
  infile.close();
  return v;
}
