function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha
  
% Initialize some useful values
  m = length(y); % number of training examples
  J_history = zeros(num_iters, 1);

  theta_n = zeros(2,1);
  
  for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    
    %theta_n(1,1) = theta(1,1) - alpha/m * sum(X*theta - y);
    %theta_n(2,1) = theta(2,1) - alpha/m * (X(:,2)'*(X*theta - y));
    %theta_n(2,1) = theta(2,1) - alpha/m * ((X*theta - y)'*X(:,2))';
    %theta_n = theta - alpha/m * ((X*theta - y)'*X)'
    
    theta_n = theta - alpha/m * X'*(X*theta - y);    
    theta = theta_n;
    
    %theta_n = theta - alpha/m * (X*theta - y) * X';
    %theta = theta_n;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

  end

end
