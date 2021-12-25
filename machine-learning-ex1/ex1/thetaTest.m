clear; close all; clc;

mu = [2 3 4];
sig = [0.5 0.75 5];
m=max(size(mu));

B = zeros(m+1);
Binv = zeros(m+1);
B(1,1) = 1;
Binv(1,1) = 1;
for j = 1:m;
  B(1,j+1) = -mu(j)/sig(j);
  Binv(1,j+1) = mu(j);
endfor

for i = 1:m;
  B(i+1,i+1) = 1/sig(i);
  Binv(i+1,i+1) = sig(i);
endfor
B*Binv
