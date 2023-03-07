%% fitting Rmax and Vmax
clc
y = cyclone{:,"Rmax"};
x = cyclone{:,"Vmax"};
myfittype = fittype('a0 + a1*x',...
    'dependent',{'y'},'independent',{'x'},...
    'coefficients',{'a0','a1'})
myfit = fit(x,y,myfittype)
plot(myfit,x,y,'*')
xlabel('Vmax  -->')
ylabel('Rmax  -->')
title('linear model fit in Vmax and Rmax')



%% fitting pc and Vmax

%clc
y = cyclone{:,"Pc"};
x = cyclone{:,"Vmax"};
myfittype = fittype('a0 + a1*x',...
    'dependent',{'y'},'independent',{'x'},...
    'coefficients',{'a0','a1'})
myfit = fit(x,y,myfittype)
plot(myfit,x,y,'*')
xlabel('Vmax  -->')
ylabel('pc  -->')
title('linear model fit in Vmax and pc')