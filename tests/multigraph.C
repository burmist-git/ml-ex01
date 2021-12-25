#include <iostream>
#include <iomanip>
#include <fstream>
#include <string>
using namespace std;

void readASCIIfiel_ex1data1_n_txt(TString filePath, TString fileName, 
				  Int_t nnMax, Int_t &nn, 
				  Double_t *xa, Double_t *ya, Double_t *errx, Double_t *erry);

Int_t multigraph(){

  Int_t i = 0;
  const Int_t nnMax = 10000;
  TString filePath = "./";
  //TString fileName = "scan_number_of_operations_ampl_octaveOut_b.dat";
  TString fileName = "scan_number_of_operations_ampl_octaveOut_c.dat";

  Int_t nn = 0; 
  Double_t xa[nnMax];
  Double_t ya[nnMax];
  Double_t errx[nnMax];
  Double_t erry[nnMax];
    
  //---------------------------------------------------------
  readASCIIfiel_ex1data1_n_txt( filePath, fileName, nnMax, nn, xa, ya, errx, erry);
  //TGraph *gr1 = new TGraph(nn,xa,ya);
  TGraphErrors *gr1 = new TGraphErrors(nn,xa,ya,errx,erry);
  //gr1->SetName("gr1");
  gr1->SetTitle("Current vs position");
  gr1->SetMarkerStyle(21);
  gr1->SetMarkerColor(kBlack);
  gr1->SetLineColor(kBlack);
  gr1->SetLineWidth(3);

  //---------------------------------------------------------

  gStyle->SetPalette(1);
  gStyle->SetFrameBorderMode(0);
  gROOT->ForceStyle();
  gStyle->SetStatColor(kWhite);
  gStyle->SetOptStat(kFALSE);

  TCanvas *c1 = new TCanvas("c1","plots",10,10,800,800);
  c1->Clear();
  c1->SetFillColor(kWhite);
  c1->GetPad(0)->SetLeftMargin(0.12);
  c1->GetPad(0)->SetRightMargin(0.02);
  c1->GetPad(0)->SetTopMargin(0.07);
  //c1->GetPad(0)->SetBottomMargin(0.02);

  TF1 *f1 = new TF1("f1","[0]*x*x + [1]*x*x*x",0.0,6000);

  // draw a frame to define the range
  TMultiGraph *mg = new TMultiGraph();
  mg->Add(gr1);
  //mg->Add(gr2);
  //mg->Add(gr3);
  //mg->Add(gr4);
  mg->Fit("f1");
  mg->Draw("AP");

  TLegend *leg = new TLegend(0.6,0.6,0.9,0.9,"","brNDC");
  leg->AddEntry(gr1, "ch1","p");
  //leg->AddEntry(gr2, "ch2","lp");
  //leg->AddEntry(gr3, "ch3","lp");
  //leg->AddEntry(gr4, "ch4","lp");
  leg->Draw();


  return 0.0;

}

void readASCIIfiel_ex1data1_n_txt(TString filePath, TString fileName, 
				  Int_t nnMax, Int_t &nn, 
				  Double_t *xa, Double_t *ya, Double_t *errx, Double_t *erry){
  string mot;
  string line;
  TString fileNameFull = filePath; fileNameFull +="/"; fileNameFull += fileName;
  cout<<"fileNameFull = "<<fileNameFull<<endl;
  ifstream myfile (fileNameFull.Data());
  Int_t i  = 0;
  Double_t x;
  Double_t y;

  if(myfile.is_open()){
    while(myfile>>x>>y){
      xa[i] = x;
      ya[i] = y;
      errx[i] = 0.01;
      erry[i] = 0.01;
      i++;
      if(i>=nnMax){
	cout<<" ---> ERROR : i>=nnMax "<<endl
	    <<"              i = "<<i<<endl
	    <<"          nnMax = "<<nnMax<<endl;
	gSystem->Exit(-1);
      }
    }
    nn = i;
    myfile.close();
  } 
  else{
    cout << "Unable to open file"; 
  }
  for(i = 0;i<nn;i++){
    cout<<setw(10)<<xa[i]
	<<setw(10)<<ya[i]<<endl;
  }
}
