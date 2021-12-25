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
%A = double(imread('bird_small.png'));
A = double(imread('kk_o.png'));
A = A / 255; % Divide by 255 so that all values are in the range 0 - 1

figure;
imagesc(A); 
title('Original');


figure;
K = 40; 
max_iters = 20;
X_recovered = runAndPlot(K,max_iters,A);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors, and maxiters %d', K, max_iters));

figure;
K = 20; 
max_iters = 20;
X_recovered = runAndPlot(K,max_iters,A);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors, and maxiters %d', K, max_iters));

figure;
K = 10 
max_iters = 20
X_recovered = runAndPlot(K,max_iters,A);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors, and maxiters %d', K, max_iters));

figure;
K = 4; 
max_iters = 20
X_recovered = runAndPlot(K,max_iters,A);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors, and maxiters %d', K, max_iters));

figure;
K = 4; 
max_iters = 1;
X_recovered = runAndPlot(K,max_iters,A);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors, and maxiters %d', K, max_iters));

fprintf('Program paused. Press enter to continue.\n');
pause;
