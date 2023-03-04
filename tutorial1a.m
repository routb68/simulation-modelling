M = csvread('climate-csv-data set - Sheet1.csv',1,1);
%% tmin and time series plot 
tempmin = zeros(167,1);
years = zeros(167,1);
for i = 1:167
    a = 0;
    for j = 1:12
        b = M((12*(i-1))+j,3);
        a = b+a;
    end
    tempmin(i) = a/12;
    years(i) =1853+i-1;
end



%% fitting the line among the mean of max temp over all years

x = years;
y = tempmin;
% Fit linear regression line with OLS.
b = [ones(size(x,1),1) x]\y;
% Use estimated slope and intercept to create regression line.
RegressionLine = [ones(size(x,1),1) x]*b;

% R2 between regression line and y
SS_X = sum((RegressionLine-mean(RegressionLine)).^2);
SS_Y = sum((y-mean(y)).^2);
SS_XY = sum((RegressionLine-mean(RegressionLine)).*(y-mean(y)));
R_squared = SS_XY/sqrt(SS_X*SS_Y);

fprintf('R2: %0.2f\n',R_squared)

%ploting
subplot(2,1,1);
plot(years, tempmin, '*','displayname','min tempetature scatter')
xlabel('years');
ylabel('average of min temperature')
title('plot mean of min temperature over all years')


% Plot it in the scatter plot and show equation.
hold on,
plot(x,RegressionLine,'displayname',sprintf('Regression line (y = %0.2f*x + %0.2f)',b(2),b(1)))
legend('location','nw')



%% doing same thing for maximum temperature
tempmax = zeros(167,1);
for i = 1:167
    a = 0;
    for j = 1:12
        b = M((12*(i-1))+j,2);
        a = b+a;
    end
    tempmax(i) = a/12;
end


%% fitting the line among the mean of max temp over all years

x = years;
y = tempmax;
% Fit linear regression line with OLS.
b = [ones(size(x,1),1) x]\y;
% Use estimated slope and intercept to create regression line.
RegressionLine = [ones(size(x,1),1) x]*b;

% R2 between regression line and y
SS_X = sum((RegressionLine-mean(RegressionLine)).^2);
SS_Y = sum((y-mean(y)).^2);
SS_XY = sum((RegressionLine-mean(RegressionLine)).*(y-mean(y)));
R_squared = SS_XY/sqrt(SS_X*SS_Y);

fprintf('R2: %0.2f\n',R_squared)

%ploting
subplot(2,1,2);
plot(years, tempmax, '*','displayname','max temperature scatter')
xlabel('years');
ylabel('average of max temperature')
title('plot mean of max temperature over all years')

% Plot it in the scatter plot and show equation.
hold on,
plot(x,RegressionLine,'displayname',sprintf('Regression line (y = %0.2f*x + %0.2f)',b(2),b(1)))
legend('location','nw')




























