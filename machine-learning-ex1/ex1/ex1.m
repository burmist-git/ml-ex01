%% Machine Learning Online Class - Exercise 1: Linear Regression

%  Instructions
%  ------------
%
%  This file contains code that helps you get started on the
%  linear exercise. You will need to complete the following functions
%  in this exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%
% x refers to the population size in 10,000s
% y refers to the profit in $10,000s
%

%% Initialization
clear ; close all; clc

%% ==================== Part 1: Basic Function ====================
% Complete warmUpExercise.m
fprintf('Running warmUpExercise ... \n');
fprintf('5x5 Identity Matrix: \n');
warmUpExercise()

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ======================= Part 2: Plotting =======================
fprintf('Plotting Data ...\n')
data = load('ex1data1.txt');
X = data(:, 1);
Xc = data(:, 1); 
y = data(:, 2);
m = length(y); % number of training examples

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 3: Cost and Gradient descent ===================

[X mu sigma] = featureNormalize(X);
[thetaM, thetaMbar] = thetaMfeatureNormalize(mu, sigma);
%mu = 0;
%sigma = 1;

X = [ones(m, 1), X(:,1)]; % Add a column of ones to x
Xc = [ones(m, 1), Xc(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters

% Plot Data
% Note: You have to complete the code in plotData.m
plotData(Xc(:,2), y);


% Some gradient descent settings
iterations = 1500;
alpha = 0.01;

fprintf('\nTesting the cost function ...\n')
% compute and display initial cost
thetap2 = theta
ttb = thetaM*thetap2
J = computeCost(X, y, ttb);
fprintf('With theta = [0 ; 0]\nCost computed = %f\n', J);
fprintf('Expected cost value (approx) 32.07\n');

% further testing of the cost function
thetap2 = [-1 ; 2]
ttb = thetaM * thetap2
J = computeCost(X, y, ttb);
fprintf('\nWith theta = [-1 ; 2]\nCost computed = %f\n', J);
fprintf('Expected cost value (approx) 54.24\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nRunning Gradient Descent ...\n')
% run gradient descent
[theta J_history]= gradientDescent(X, y, theta, alpha, iterations);

predict1My = [1, (3.5-mu(1))/sigma(1)]*theta;
fprintf(' My for population = 35,000, we predict a profit of %f\n',...
    predict1My*10000);
predict2My = [1, (7.0-mu(1))/sigma(1)]*theta;
fprintf(' My for population = 70,000, we predict a profit of %f\n',...
    predict2My*10000);

theta
theta = thetaMbar * theta 
theta

% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);
fprintf('Expected theta values (approx)\n');
fprintf(' -3.6303\n  1.1664\n\n');

% Plot the linear fit
hold on; % keep previous plot visible
plot(Xc(:,2), Xc*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

figure
plot([1:length(J_history)],J_history)


%fprintf('Expected theta values (approx)\n');
%fprintf(' -3.6303\n  1.1664\n\n');
%p0                        =     -3.89578   +/-   0.719483    
%p1                        =      1.19303   +/-   0.0797439   
%p0                        =     -3.89578   +/-   0.719483    
%p1                        =      1.19303   +/-   0.0797439   
%theta =
%                                 -3.8958   1.1930
%35,000 -  2798.370636
%70,000 - 44554.534336

% Predict values for population sizes of 35,000 and 70,000
theta
predict1 = [1, 3.5]*theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
theta
predict2 = [1, 7]*theta;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= Part 4: Visualizing J(theta_0, theta_1) =============
fprintf('Visualizing J(theta_0, theta_1) ...\n')

% Grid over which we will calculate J
%theta0_vals = linspace(0, 10, 100);
%theta1_vals = linspace(0, 10, 100);
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace( 0, 5, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(Xc, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals);
xlabel('\theta_0'); ylabel('\theta_1');

figure;
plot(J_vals)

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(0, 10, 20))
%contour(theta0_vals, theta1_vals, J_vals, linspace(0, 50, 100))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);

pause;
