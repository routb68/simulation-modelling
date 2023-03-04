%% here we are calculating for max temp
%1st and then we will be calculating for min temp treand over all seasonas

%%
x = SimT1Q1S1{:,"time"};
y = SimT1Q1S1{:,"tmax"};
ft = fittype(' b0+b1*cos((2*pi)*(x)/12)+b2*sin((2*pi)*(x))+b3*(x)',...
    'dependent',{'y'},'independent',{'x'},...
    'coefficients',{'b0','b1','b2','b3'});

f = fit(x,y,ft)
plot(f,x,y,'O')


xlabel('time');
ylabel('max temperature')
title('linear model accouniting seasonal effects.')

%% seasonal linear plotting for min temperature

x = SimT1Q1S1{:,"time"};
y = SimT1Q1S1{:,"tmin"};
ft = fittype(' b0+b1*cos((2*pi)*(x)/12)+b2*sin((2*pi)*(x))+b3*(x)',...
    'dependent',{'y'},'independent',{'x'},...
    'coefficients',{'b0','b1','b2','b3'});

f = fit(x,y,ft)
plot(f,x,y,'O')


xlabel('time');
ylabel('min temperature scatter')
title('linear model accouniting seasonal effects for min temp.')