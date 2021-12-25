/***********************************************************************
* Copyright(C) 2020 - LBS - (Single person developer.)                 *
* Mon May  4 03:31:15 CEST 2020                                        *
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

int main(int argc, char *argv[]){
  int n = atoi(argv[1]);
  TRandom3 *rnd = new TRandom3(123123);
  TH2D *h2 = new TH2D("h2","h2",1000,-35,35,1000,-35,35);
  TH2D *h2op = new TH2D("h2op","h2op",1000,-35,35,1000,-35,35);
  TH2D *h2opv = new TH2D("h2opv","h2opv",1000,-35,35,1000,-35,35);
  TH2D *h2ops = new TH2D("h2ops","h2ops",1000,-35,35,1000,-35,35);
  TH2D *h2opu = new TH2D("h2opu","h2opu",1000,-35,35,1000,-35,35);
  TH2D *h2opvs = new TH2D("h2opvs","h2opvs",1000,-35,35,1000,-35,35);
  TH2D *h2opvsu = new TH2D("h2opvsu","h2opvsu",1000,-35,35,1000,-35,35);
  double k=1.0;
  double l=1.0;
  //double a[2][2] = {{0.5,4.0},{-0.7,0.3}};
  //double a[2][2] = {{0.5,0.0},{0.0,1.0}};
  double a[2][2] = {{     1.0,      0.5},
		    {     0.5,      1.0}};
  double u[2][2] = {{-0.70711, -0.70711},
		    {-0.70711,  0.70711}};
  double s[2][2] = {{ 1.50000,        0},
		    {       0,  0.50000}};
  double v[2][2] = {{-0.70711, -0.70711},
		    {-0.70711,  0.70711}};
  double xh, yh, xhn, yhn;
  double xv, yv, xvn, yvn;
  //
  double xh_v_n, yh_v_n;
  double xv_v_n, yv_v_n;
  //
  double xh_s_n, yh_s_n;
  double xv_s_n, yv_s_n;
  //
  double xh_u_n, yh_u_n;
  double xv_u_n, yv_u_n;
  //
  double xh_vs_n, yh_vs_n;
  double xv_vs_n, yv_vs_n;
  //
  double xh_vsu_n, yh_vsu_n;
  double xv_vsu_n, yv_vsu_n;
  //
  for(int i = 0;i<n;i++){
    //x = rnd->Gaus(0,10);
    //y = rnd->Gaus(0,1);
    //
    xh = rnd->Uniform(-20,20);
    yh = (Int_t)rnd->Uniform(-20,20);
    yv = rnd->Uniform(-20,20);
    xv = (Int_t)rnd->Uniform(-20,20);
    //
    xhn = xh*a[0][0]*k + yh*a[0][1]*k;
    yhn = xh*a[1][0]*k + yh*a[1][1]*k;   
    //
    xvn = xv*a[0][0]*k + yv*a[0][1]*k;
    yvn = xv*a[1][0]*k + yv*a[1][1]*k;   
    //
    //v - u*s*v   
    xh_v_n = xh*v[0][0]*k + yh*v[0][1]*k;
    yh_v_n = xh*v[1][0]*k + yh*v[1][1]*k;
    //
    xv_v_n = xv*v[0][0]*k + yv*v[0][1]*k;
    yv_v_n = xv*v[1][0]*k + yv*v[1][1]*k;
    //
    //s - u*s*v
    xh_s_n = xh*s[0][0]*k + yh*s[0][1]*k;
    yh_s_n = xh*s[1][0]*k + yh*s[1][1]*k;
    //
    xv_s_n = xv*s[0][0]*k + yv*s[0][1]*k;
    yv_s_n = xv*s[1][0]*k + yv*s[1][1]*k;
    //
    //u - u*s*v
    xh_u_n = xh*u[0][0]*k + yh*u[0][1]*k;
    yh_u_n = xh*u[1][0]*k + yh*u[1][1]*k;
    //
    xv_u_n = xv*u[0][0]*k + yv*u[0][1]*k;
    yv_u_n = xv*u[1][0]*k + yv*u[1][1]*k;
    //
    //vs - u*s*v
    xh_vs_n = xh_v_n*s[0][0]*k + yh_v_n*s[0][1]*k;
    yh_vs_n = xh_v_n*s[1][0]*k + yh_v_n*s[1][1]*k;
    //
    xv_vs_n = xv_v_n*s[0][0]*k + yv_v_n*s[0][1]*k;
    yv_vs_n = xv_v_n*s[1][0]*k + yv_v_n*s[1][1]*k;
    //
    //vsu - u*s*v
    xh_vsu_n = xh_vs_n*u[0][0]*k + yh_vs_n*u[0][1]*k;
    yh_vsu_n = xh_vs_n*u[1][0]*k + yh_vs_n*u[1][1]*k;
    //
    xv_vsu_n = xv_vs_n*u[0][0]*k + yv_vs_n*u[0][1]*k;
    yv_vsu_n = xv_vs_n*u[1][0]*k + yv_vs_n*u[1][1]*k;
    //
    h2->Fill(xh*l,yh*l);
    h2op->Fill(xhn,yhn);
    h2->Fill(xv*l,yv*l);
    h2op->Fill(xvn,yvn);
    //
    h2opv->Fill(xh_v_n,yh_v_n);
    h2opv->Fill(xv_v_n,yv_v_n);
    //
    h2ops->Fill(xh_s_n,yh_s_n);
    h2ops->Fill(xv_s_n,yv_s_n);
    //
    h2opu->Fill(xh_u_n,yh_u_n);
    h2opu->Fill(xv_u_n,yv_u_n);
    //
    h2opvs->Fill(xh_vs_n,yh_vs_n);
    h2opvs->Fill(xv_vs_n,yv_vs_n);
    //
    h2opvsu->Fill(xh_vsu_n,yh_vsu_n);
    h2opvsu->Fill(xv_vsu_n,yv_vsu_n);
  }
  TString rootfOut = "hist.root";
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
  h2op->Write();
  h2opv->Write();
  h2ops->Write();
  h2opu->Write();
  h2opvs->Write();
  h2opvsu->Write();
  rootFile->Close();
  
  return 0;
}
