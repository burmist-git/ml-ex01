%% Machine Learning Online Class - Exercise 3 | Part 3
%% ================ Part 3: Predict for One-Vs-All ================
clear ; close all; clc

load('ex3data1.mat'); % training data stored in arrays X, y
load('all_theta.mat'); % training theta all

pred = predictOneVsAll(all_theta, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
