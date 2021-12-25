function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

C_arr=[0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_arr=[0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
%C_arr=[0.3, 1, 3,];
%sigma_arr=[0.03, 0.1, 0.3];
%C_arr=[0.03, 0.06, 0.1, 0.3, 0.6, 0.9, 1, 1.3 , 1.6];
%sigma_arr=[0.01, 0.03, 0.06, 0.09, 0.12, 0.15, 0.18, 0.21, 0.4, 0.8];
%C_arr=[0.6, 0.7, 0.8, 0.9, 1, 1.1,  1.2, 1.3, 1.4, 1.5];
%sigma_arr=[0.02, 0.04, 0.06, 0.08, 0.1, 0.12, 0.14, 0.16, 0.18, 0.2];
%C_arr=[0.1, 0.3, 1, 3, 10];
%sigma_arr=[0.01, 0.03, 0.1, 0.3, 1];
%C_arr=[0.6, 0.7];
%sigma_arr=[0.02, 0.04];
%C_arr=[0.03];
%sigma_arr=[0.01];
[xc, ysig] = meshgrid (C_arr, sigma_arr);


%printf("%5s %5s \n",'j = ','i = ');
for j = 1:length(C_arr)
  for i = 1:length(sigma_arr)
    %printf("%5d %5d \n",j,i);
    C = xc(i,j);
    sigma = ysig(i,j);
    model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
    predictions = svmPredict(model, Xval);
    err(i,j)=mean(double(predictions ~= yval));
    if(j == 1 && i == 1)
      minErr = err(i,j);
    endif
    if(err(i,j)<minErr)
      minErr = err(i,j);
      C_min = C;
      sigma_min = sigma;
    endif
    endfor
endfor
%minErr = min(min(err));
%[minErr_i, minErr_j] = find(err == minErr);
%printf("j = %5d i = %5d \n",minErr_j,minErr_i);
%printf("C     = %10.5f \n",xc(minErr_j,minErr_i));
%printf("sigma = %10.5f \n",ysig(minErr_j,minErr_i));
%C = mean(mean(xc(minErr_j,minErr_i)));
%sigma = mean(mean(ysig(minErr_j,minErr_i)));
C = C_min;
sigma = sigma_min;
%printf("mean min C     = %10.5f \n",C);
%printf("mean min sigma = %10.5f \n",sigma);


%figure;
%mesh (xc, ysig, err);
%xlabel ("c");
%ylabel ("sig");
%zlabel ("err");
%title ("C and sigma optimisation");
%pause;

% =========================================================================

end
