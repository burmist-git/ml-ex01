function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

I=eye(num_labels);
y_v=zeros(num_labels,m);
for i = 1:m
  y_v(:,i)=I(:,y(i));
endfor

a1=[ones(1,m);X'];
a2=[ones(1,m);sigmoid(Theta1*a1)];
h=sigmoid(Theta2*a2);
J=sum(sum(-y_v.*log(h)-(1-y_v).*log(1-h)));
J=J+(lambda/2)*(sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2)));
J=J/m;

% -------------------------------------------------------------

sigma_3 = h-y_v;
sigma_2 = Theta2(:,2:end)'*sigma_3.*a2(2:end,:).*(1-a2(2:end,:));

delta_1 = sigma_2*a1'/m;
delta_2 = sigma_3*a2'/m;

reg_1 = (lambda/m)*[zeros(size(Theta1,1),1),Theta1(:,2:end)];
reg_2 = (lambda/m)*[zeros(size(Theta2,1),1),Theta2(:,2:end)];

Theta1_grad = delta_1 + reg_1;
Theta2_grad = delta_2 + reg_2;

%printf("size X       : %10d %5d \n",size(X));
%printf("size y       : %10d %5d \n",size(y));
%printf("size Theta1  : %10d %5d \n",size(Theta1));
%printf("size Theta2  : %10d %5d \n",size(Theta2));
%printf("size a1      : %10d %5d \n",size(a1));
%printf("size a2      : %10d %5d \n",size(a2));
%printf("size h       : %10d %5d \n",size(h));
%printf("size y_v     : %10d %5d \n",size(y_v));
%printf("size sigma_3 : %10d %5d \n",size(sigma_3));
%printf("size sigma_2 : %10d %5d \n",size(sigma_2));
%printf("size delta_1 : %10d %5d \n",size(delta_1));
%printf("size delta_2 : %10d %5d \n",size(delta_2));

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
