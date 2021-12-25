function plot_matrix_number_of_operations()
  #A est R^(n,m)
  #B est R^(m,n)
  #matrix_N_of_oper;
  figure;
  plotDataMult("scan_number_of_operations_mult_small.dat",
	       "scan_number_of_operations_multnorm_small.dat");
  hold on;
  plotDataElOper("scan_number_of_operations_elplus.dat",
		 "scan_number_of_operations_elnorm.dat",'ko','b');
  plotDataElOper("scan_number_of_operations_elmult.dat",
		 "scan_number_of_operations_elnorm.dat",'ko','r');
  plotDataElOper("scan_number_of_operations_eldivi.dat",
		 "scan_number_of_operations_elnorm.dat",'ko','g');
  hold off;
  legend('Mult', 'Elplus', 'Elmult', 'Eldivi')
  xlabel('Operations');
  ylabel('Time, s');
  pause;
  return;
end

function matrix_N_of_oper()
  ndiv=100;
  nmax=10000;
  mmax=10000;
  n = linspace(1, nmax, ndiv);
  m = linspace(1, mmax, ndiv);
  oper_ampl = n_oper_ampl(n,m);
  oper_plus = n_oper_plus(n,m);

  figure;
  contour ( m, n, oper_plus, linspace(1, nmax*mmax, ndiv), 'LineWidth', 2);
  figure;
  mesh ( m, n, oper_plus);
  xlabel('m');
  ylabel('n');

  figure;
  contour ( m, n, oper_ampl, linspace(1, nmax*nmax*(2*mmax-1), ndiv), 'LineWidth', 2);
  figure;
  mesh ( m, n, oper_ampl);
  xlabel('m');
  ylabel('n');

  figure;
  ysum = n.^2;
  yampl = n.^2.*(2.*n - 1);
  semilogy(n, yampl, 'k+', 'LineWidth', 1, 'MarkerSize', 7)
  hold on;
  semilogy(n, ysum,  'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)
  hold off;
end;

function plotDataMult(fileN,fileNnorm)
  data=load(fileN);
  datanorm=load(fileNnorm);
  x=data(:,1);
  y=mean(data(:,2:end),2);
  ynorm=mean(datanorm(:,2:end),2);
  ysum = x.^2;
  ymult = x.^2.*(2.*x - 1);
  plot(ymult, y-ynorm,  'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
  %xplot=find(ymult<700000000)
  %plot(ymult(xplot), y(xplot),  'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)
  %figure;
  %plot(ymult, y,  'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)
  %figure;
  %plot(ysum, ynorm,  'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)
  %figure;
  %plot(x, ynorm,  'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)
  %semilogy(x, y,  'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)
  %figure;
  %plot(yampl, y,  'k+', 'MarkerFaceColor', 'y', 'MarkerSize', 7)
  %b=[x(:),y(:)];
  %c=[x(:),yampl(:)];
  %save -mat 'scan_number_of_operations_ampl_octaveOut.mat' x y ysum yampl
  %save 'scan_number_of_operations_ampl_octaveOut_b.dat' b
  %save 'scan_number_of_operations_ampl_octaveOut_c.dat' c
end

function plotDataElOper(fileN,fileNnorm,markerShape,markerColor)
  data=load(fileN);
  datanorm=load(fileNnorm);
  x=data(:,1);
  y=mean(data(:,2:end),2);
  ynorm=mean(datanorm(:,2:end),2);
  ysum = x.^2;
  ymult = x.^2.*(2.*x - 1);
  %plot(ysum, y-ynorm,  'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)
  plot(ysum, y-ynorm,  markerShape, 'MarkerFaceColor', markerColor, 'MarkerSize', 7)
end

function [oper_n] = n_oper_plus (n,m)
  oper_n = n(:)*m(:)';
end

function [oper_n] = n_oper_ampl (n,m)
  oper_n = n(:)*(2*m(:).^2-1)';
end
