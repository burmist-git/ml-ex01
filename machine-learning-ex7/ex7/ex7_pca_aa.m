%% Machine Learning Online Class
%  Exercise 7 | Principle Component Analysis and K-Means Clustering
%
%  Instructions
%  ------------
%
%  This file contains code that helps you get started on the
%  exercise. You will need to complete the following functions:
%
%     pca.m
%     projectData.m
%     recoverData.m
%     computeCentroids.m
%     findClosestCentroids.m
%     kMeansInitCentroids.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%

%% Initialization
clear ; close all; clc

%% =============== Part 4: Loading and Visualizing Face Data =============
%  We start the exercise by first loading and visualizing the dataset.
%  The following code will load the dataset into your environment
%
fprintf('\nLoading face dataset.\n\n');

aa = double(imread('aa_o.png'));
kk = double(imread('kk_o.png'));
ll = double(imread('ll_o.png'));

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

%aa = mean(reshape(aa, size(aa,1)*size(aa,2), 3),2)';
%kk = mean(reshape(kk, size(kk,1)*size(kk,2), 3),2)';
%ll = mean(reshape(ll, size(ll,1)*size(ll,2), 3),2)';
aa = reshape(aa, size(aa,1)*size(aa,2), 1)';
kk = reshape(kk, size(kk,1)*size(kk,2), 1)';
ll = reshape(ll, size(ll,1)*size(ll,2), 1)';

%  Load Face dataset
load ('ex7faces.mat')

cc = [aa;kk;ll];

X = [cc;X];

%  Display the first 100 faces in the dataset
%displayData(X(1:100, :));

%fprintf('Program paused. Press enter to continue.\n');
%pause;

%% =========== Part 5: PCA on Face Data: Eigenfaces  ===================
%  Run PCA and visualize the eigenvectors which are in this case eigenfaces
%  We display the first 36 eigenfaces.
%
fprintf(['\nRunning PCA on face dataset.\n' ...
         '(this might take a minute or two ...)\n\n']);

%  Before running PCA, it is important to first normalize X by subtracting 
%  the mean value from each feature
[X_norm, mu, sigma] = featureNormalize(X);

%  Run PCA
[U, S] = pca(X_norm);

%semilogy(S(find(S)));
%pause;
%  Visualize the top 36 eigenvectors found
%displayData(U(:,1:36)');

%fprintf('Program paused. Press enter to continue.\n');
%pause;



%fprintf('\n\nProgram paused. Press enter to continue.\n');
%pause;

%% ==== Part 7: Visualization of Faces after PCA Dimension Reduction ====
%  Project images to the eigen space using the top K eigen vectors and 
%  visualize only using those K dimensions
%  Compare to the original input, which is also displayed

fprintf('\nVisualizing the projected (reduced dimension) faces.\n\n');

gg=18

% Display normalized data
%figure;
%subplot(1, 2, 1);
displayData(X_norm(gg:gg,:));
title('Original faces');
axis square;

#
K = 1000;
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);
figure;
displayData(X_rec(gg:gg,:));
title('Recovered faces');
axis square;
#
K = 500;
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);
figure;
displayData(X_rec(gg:gg,:));
title('Recovered faces');
axis square;
#
K = 350;
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);
figure;
displayData(X_rec(gg:gg,:));
title('Recovered faces');
axis square;
#
K = 200;
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);
figure;
displayData(X_rec(gg:gg,:));
title('Recovered faces');
axis square;
#
K = 100;
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);
figure;
displayData(X_rec(gg:gg,:));
title('Recovered faces');
axis square;
#
K = 90;
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);
figure;
displayData(X_rec(gg:gg,:));
title('Recovered faces');
axis square;
#
K = 80;
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);
figure;
displayData(X_rec(gg:gg,:));
title('Recovered faces');
axis square;
#
K = 70;
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);
figure;
displayData(X_rec(gg:gg,:));
title('Recovered faces');
axis square;
#
K = 60;
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);
figure;
displayData(X_rec(gg:gg,:));
title('Recovered faces');
axis square;
#
K = 50;
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);
figure;
displayData(X_rec(gg:gg,:));
title('Recovered faces');
axis square;
#
K = 10;
Z = projectData(X_norm, U, K);
X_rec  = recoverData(Z, U, K);
figure;
displayData(X_rec(gg:gg,:));
title('Recovered faces');
axis square;

saveas (1,"fig12rr.png");
saveas (2,"fig11rr.png");
saveas (3,"fig10rr.png");
saveas (4,"fig09rr.png");
saveas (5,"fig08rr.png");
saveas (6,"fig07rr.png");
saveas (7,"fig06rr.png");
saveas (8,"fig05rr.png");
saveas (9,"fig04rr.png");
saveas (10,"fig03rr.png");
saveas (11,"fig02rr.png");
saveas (12,"fig01rr.png");

fprintf('Program paused. Press enter to continue.\n');
pause;

