function [thetaM, thetaMbar] = thetaMfeatureNormalize(mu, sigma);
  m=max(size(mu));  
  thetaM = zeros(m+1);
  thetaMbar = zeros(m+1);
  thetaM(1,1) = 1;
  thetaMbar(1,1) = 1;
  for j = 1:m;
    thetaM(1,j+1) = mu(j);
    thetaMbar(1,j+1) =  -mu(j)/sigma(j);
  endfor;  
  for i = 1:m;
    thetaM(i+1,i+1) = sigma(i);
    thetaMbar(i+1,i+1) = 1/sigma(i);
  endfor;
end
