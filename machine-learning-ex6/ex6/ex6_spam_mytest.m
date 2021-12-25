%% Adopted from : machine Learning Online Class
%  Exercise 6 | Spam Classification with SVMs
%

%% Initialization
clear ; close all; clc

%% =========== Part 3: Train Linear SVM for Spam Classification ========
%  In this section, you will train a linear classifier to determine if an
%  email is Spam or Not-Spam.

% Load the Spam Email dataset
% You will have X, y in your environment
%load('spamTrain.mat');
%fprintf('\nTraining Linear SVM (Spam Classification)\n')
%fprintf('(this may take 1 to 2 minutes) ...\n')
%C = 0.1;
%model = svmTrain(X, y, C, @linearKernel);
%model_X=model.X;
%model_y=model.y;
%model_kernelFunction=model.kernelFunction
%model_b=model.b;
%model_alphas=model.alphas;
%model_w=model.w;
%save -ascii 'model_ex6_SVM_for_Spam_Classification.dat' model_X ...
%model_y model_b model_alphas model_w;
%save -mat 'model_ex6_SVM_for_Spam_Classification.mat' model_X model_y ...
%model_b model_alphas model_w;
%exit;
%model_X model_y model_kernelFunction model_b model_alphas model_w

%C = 0.1;
%load('spamTrain.mat');
modelf=load('model_ex6_SVM_for_Spam_Classification.mat');
model.X=modelf.model_X;
model.y=modelf.model_y;
model.kernelFunction=@linearKernel;
model.b=modelf.model_b;
model.alphas=modelf.model_alphas;
model.w=modelf.model_w;
%p = svmPredict(model, X);
%fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);

%% =================== Part 4: Test Spam Classification ================
%  After training the classifier, we can evaluate it on a test set. We have
%  included a test set in spamTest.mat

% Load the test dataset
% You will have Xtest, ytest in your environment
%load('spamTest.mat');

%fprintf('\nEvaluating the trained Linear SVM on a test set ...\n')

%p = svmPredict(model, Xtest);

%fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);
%pause;

%% =================== Part 6: Try Your Own Emails =====================
%  Now that you've trained the spam classifier, you can use it on your own
%  emails! In the starter code, we have included spamSample1.txt,
%  spamSample2.txt, emailSample1.txt and emailSample2.txt as examples. 
%  The following code reads in one of these emails and then uses your 
%  learned SVM classifier to determine whether the email is Spam or 
%  Not Spam

% Set the file to be read in (change this to spamSample2.txt,
% emailSample1.txt or emailSample2.txt to see different predictions on
% different emails types). Try your own emails as well!
%filename = 'spamSample3.txt';
filename = 'emailSample3.txt';

% Read and predict
file_contents = readFile(filename);
word_indices  = processEmail(file_contents);
x             = emailFeatures(word_indices);
p = svmPredict(model, x);

fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, p);
fprintf('(1 indicates spam, 0 indicates not spam)\n\n');
