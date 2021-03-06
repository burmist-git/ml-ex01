function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

%printf('size X     : %10d, %5d \n',size(X));
%printf('size y     : %10d, %5d \n',size(y));
%printf('size theta : %10d, %5d \n',size(theta));

J=(1/2/m)*((X*theta-y)'*(X*theta-y)+lambda*theta(2:end,:)'*theta(2:end,:));
grad=(1/m)*(sum((X*theta-y).*X,1) + lambda*[0;theta(2:end)]');


% =========================================================================

grad = grad(:);

end
