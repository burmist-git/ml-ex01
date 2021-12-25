function mergeAndShuffleDataSet()

  x=load('./data/easy_ham/easy_ham.mat').x;
  y=load('./data/easy_ham/easy_ham.mat').y;
  x=[x;load('./data/easy_ham_2/easy_ham_2.mat').x];
  y=[y;load('./data/easy_ham_2/easy_ham_2.mat').y];
  x=[x;load('./data/hard_ham/hard_ham.mat').x];
  y=[y;load('./data/hard_ham/hard_ham.mat').y];
  x=[x;load('./data/spam/spam.mat').x];
  y=[y;load('./data/spam/spam.mat').y];
  x=[x;load('./data/spam_2/spam_2.mat').x];
  y=[y;load('./data/spam_2/spam_2.mat').y];

  n=length(y);
  ntrain=floor(n/5*3);
  ncrosv=floor(n/5);
  
  id=randperm(n);
  x=x([id],:);
  y=y([id],:);
  xtrain=x(1:ntrain,:);
  xcrosv=x((ntrain+1):(ntrain+ncrosv),:);
  xtest=x((ntrain+ncrosv+1):end,:);
  ytrain=y(1:ntrain,:);
  ycrosv=y((ntrain+1):(ntrain+ncrosv),:);
  ytest=y((ntrain+ncrosv+1):end,:);
  
  save -mat 'trainset.mat' xtrain ytrain
  save -mat 'crosvset.mat' xcrosv ycrosv
  save -mat 'testset.mat' xtest ytest

  saveLibsvmFormat(xtrain,ytrain,'trainset.in');
  saveLibsvmFormat(xcrosv,ycrosv,'crosvset.in');
  saveLibsvmFormat(xtest,ytest,'testset.in');

end
