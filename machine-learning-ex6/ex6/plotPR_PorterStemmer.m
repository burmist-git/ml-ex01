%% Initialization
clear ; close all; clc
data = load('porterPR.dat');
%X = data(:, 1)
%y1 = data(:, 2) 
%y2 = data(:, 3)
%m = length(y); % number of training examples

figure
plot(data(:, 2)/100, data(:, 1)/100, 'k+','LineWidth', 1, 'MarkerSize', 7)
hold on;
plot(data(:, 3)/100, data(:, 1)/100, 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)

x = linspace(0.01, 0.99, 100);
y = linspace(0.01, 0.99, 100);
z = zeros(length(x), length(y));
for i = 1:length(x)
  for j = 1:length(y)
    z(i,j) = 2*x(i)*y(j)/(x(i) + y(j));
  end
end
contour ( x, y, z, linspace(0, 1.0, 20), 'LineWidth', 2);

axis([-0.1 1.1 -0.1 1.1]);
xlabel('Recall');
ylabel('Precission');

hold off;
  

pause;

