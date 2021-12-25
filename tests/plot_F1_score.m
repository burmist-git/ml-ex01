function plot_F1_score()

  x = linspace(0.01, 0.99, 100);
  y = linspace(0.01, 0.99, 100);
  z = zeros(length(x), length(y));
  for i = 1:length(x)
    for j = 1:length(y)
      z(i,j) = 2*x(i)*y(j)/(x(i) + y(j));
    end
  end

  figure;
  contour ( x, y, z, linspace(0, 1.0, 20), 'LineWidth', 2);

  figure;
  mesh ( x, y, z);


  figure;
  tx = ty = linspace (-8, 8, 41)';
  [xx, yy] = meshgrid (tx, ty);
  r = sqrt (xx .^ 2 + yy .^ 2) + eps;
  tz = sin (r) ./ r;
  mesh (tx, ty, tz);
  xlabel ("tx");
  ylabel ("ty");
  zlabel ("tz");
  title ("3-D Sombrero plot");

  figure;
  t = 0:0.1:10*pi;
  r = linspace (0, 1, numel (t));
  z = linspace (0, 1, numel (t));
  plot3 (r.*sin (t), r.*cos (t), z);
  xlabel ("r.*sin (t)");
  ylabel ("r.*cos (t)");
  zlabel ("z");
  title ("plot3 display of 3-D helix");
  
  pause;
  return;
  
end
