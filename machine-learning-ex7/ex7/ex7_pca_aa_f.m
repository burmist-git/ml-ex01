function ex7_pca_aa_f( gg, K, keyGo)
  
  aa = double(imread('./png/aa_o.png'));
  kk = double(imread('./png/kk_o.png'));
  for iii = 1:32
    for jjj = 1:2
      kk(iii,30+jjj) = 0;
      kk(iii,30+jjj) = 0;
      kk(iii,30+jjj) = 0;
    endfor
  endfor
  for iii = 1:32
    for jjj = 1:1
      ll(iii,30+jjj) = 0;
      ll(iii,30+jjj) = 0;
      ll(30+jjj,iii) = 0;
    endfor
  endfor
  aa = reshape(aa, size(aa,1)*size(aa,2), 1)';
  kk = reshape(kk, size(kk,1)*size(kk,2), 1)';
  
  load ('ex7faces.mat')
  cc = [aa;kk];
  X = [cc;X];
  
  [X_norm, mu, sigma] = featureNormalize(X);
  [U, S] = pca(X_norm);

  if(keyGo == 1)
    displayData(X_norm(gg:gg,:));
    title('Original faces');
    axis square;
    saveas (1,"figo.png");
    exit;
  endif

  
  Z = projectData(X_norm, U, K);
  X_rec  = recoverData(Z, U, K);
  figure;
  displayData(X_rec(gg:gg,:));
  title('Recovered faces');
  title(sprintf('Recovered faces, with K = %d ', K));
  axis square;

  saveas (1,"fig.png");

end
