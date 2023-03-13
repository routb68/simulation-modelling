clc
clear variables
close all
%% Load the dataset
data = readtable('C:\Users\SHUBHAM\Downloads\data_prob_6.xlsx');


x = data.x;
y = data.y;

train_er = zeros(7,1);
test_er = zeros(7,1);

%% spliting data into test and train data
xtrain = zeros(48,1);
xtest = zeros(12,1);
ytrain = zeros(48,1);
ytest = zeros(12,1);

%% Split the dataset into training and test sets
rng(1) % for reproducibility
idx = randperm(length(x));
train_idx = idx(1:round(0.8*length(x)));
test_idx = idx(round(0.8*length(x))+1:end);
xtrain = x(train_idx);
ytrain = y(train_idx);
xtest = x(test_idx);
ytest = y(test_idx);

%for i = 1:60
   % if i<49
       % xtrain(i) = x(i);
       % ytrain(i) = y(i);
   % else
       % xtest(i-48) = x(i);
       % ytest(i-48) = y(i);
   % end
   % end

%%
for i = 1:7
    p = polyfit(xtrain,ytrain,i)
    ypre = polyval(p,xtest);
    test_er(i) = mean((ytest-ypre).^2);
    ypre = polyval(p,xtrain);
    train_er(i) = mean((ytrain-ypre).^2);
    subplot(2,4,i);
    plot(x,y,'O');
    hold on 
    plot(x,polyval(p,x));
    title("ploting ");
    hold off
end

%%
subplot(2,4,8);
d = 1:7;
plot (d,train_er,'b-o',d,test_er,'r-o','LineWidth',2);
legend('train-er','test_er')
xlabel('degree')
ylabel('error')
