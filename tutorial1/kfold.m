clear all
close all
clc
					
data=load('cyclonedata.txt');
Vmax = data(:,3);
Pc = data(:,4);
Rmax = data(:,6);		
Lat = data(:,1);
fprintf('Model:Rmax=a0+a1*Vmax+a2*Lat\n');
fprintf('============================\n');
fprintf('\n K-fold Analysis \n') fprintf('\n\t\t\tK\t\t\tRsquare\t\t\tRMSE\t\t\tMAE\t\t\t\ta0\t\t\t\ta1\t\t\t\ta2\n'); fprintf('\t\t\t======================================================================== ===========================\n');
k = [5 8 10];
n = length(Vmax);
for j = 1:length(k)
rmse = 0;
mae = 0;
rsq = 0;
indices = crossvalind('Kfold',n,k(j)); 
for i = 1:5
test = (indices==i); %validation
train = ~test; %calibration
X = [ones(size(Vmax(train))),Vmax(train),Lat(train)];
a = regress(Rmax(train),X);
Rmax_kf = a(1,1) + a(2,1)*Vmax(test) + a(3,1)*Lat(test); rmse = rmse + RMSE_kf(Rmax(test),Rmax_kf);
mae = mae +MAE_kf(Rmax(test),Rmax_kf);
rsq = rsq+RSQUARE_kf(Rmax(test),Rmax_kf);
end
figure(j)
plot(Vmax(test),Rmax_kf,'.','MarkerSize',7);
title(['K = ',num2str(k(j))]);
xlabel('Vmax(test)');
ylabel('Rmax_kf'); fprintf('\n\t\t\t%2.0f\t\t\t%5.4f\t\t\t%5.4f\t\t\t%5.4f\t\t\t%5.4f\t\t\t%5.4f\t\t\t%5.4 f\n',k(j),rsq/k(j),rmse/k(j),mae/k(j),a(1),a(2),a(3));	
end									
fprintf('\n Method of Least squares errors \n')
X = [ones(size(Vmax)),Vmax,Lat];
b = regress(Rmax,X);
Rmax_linear = b(1,1) + b(2,1)*Vmax + b(3,1)*Lat; fprintf('\n\t\t\t\t\t\tRsquare\t\t\tRMSE\t\t\tMAE\t\t\t\ta0\t\t\t\ta1\t\t\t\ta2\n'); fprintf('\t\t\t\t\t\t================================================================== =========================\n'); fprintf('\n\t\t\t\t\t\t%5.4f\t\t\t%5.4f\t\t\t%5.4f\t\t\t%5.4f\t\t\t%5.4f\t\t\t%5.4f\n', RSQUARE_kf(Rmax,Rmax_linear),RMSE_kf(Rmax,Rmax_linear),MAE_kf(Rmax,Rmax_linear),b(1),b( 2),b(3));
