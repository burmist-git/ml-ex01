//C, C++
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>

#include <time.h>

using namespace std;

Int_t plots(){
  //
  TString file_s1;
  file_s1 = "hist.root";
  TFile *f_s1 = new TFile(file_s1.Data());

  TH2D *h2 = (TH2D*)f_s1->Get("h2");
  TH2D *h2op = (TH2D*)f_s1->Get("h2op");
  TH2D *h2opv = (TH2D*)f_s1->Get("h2opv");
  TH2D *h2ops = (TH2D*)f_s1->Get("h2ops");
  TH2D *h2opu = (TH2D*)f_s1->Get("h2opu");
  TH2D *h2opvs = (TH2D*)f_s1->Get("h2opvs");
  TH2D *h2opvsu = (TH2D*)f_s1->Get("h2opvsu");
  
  TCanvas *c1 = new TCanvas("c1","c1",10,10,1200,600);
  gStyle->SetPalette(1);
  gStyle->SetFrameBorderMode(0);
  gROOT->ForceStyle();
  gStyle->SetStatColor(kWhite);
  gStyle->SetOptStat(kFALSE);
  c1->Divide(2,1);
  c1->cd(1);
  h2->Draw("ZCOLOR");
  c1->cd(2);
  h2op->Draw("ZCOLOR");

  TCanvas *c2 = new TCanvas("c2","c2",20,20,1800,600);
  c2->Divide(3,1);
  c2->cd(1);
  h2opv->Draw("ZCOLOR");
  c2->cd(2);
  h2ops->Draw("ZCOLOR");
  c2->cd(3);
  h2opu->Draw("ZCOLOR");

  TCanvas *c3 = new TCanvas("c3","c3",30,30,1800,600);
  c3->Divide(3,1);
  c3->cd(1);
  h2opv->Draw("ZCOLOR");
  c3->cd(2);
  h2opvs->Draw("ZCOLOR");
  c3->cd(3);
  h2opvsu->Draw("ZCOLOR");
  
  return 0;
}
