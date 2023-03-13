x = dataprob6{:,"x"};
y = dataprob6{:,"y"};

train_er = zeros(7,1);
test_er = zeros(7,1);

%% spliting data into test and train data
xtrain = zeros(48,1);
xtest = zeros(12,1);
ytrain = zeros(48,1);
ytest = zeros(12,1);

for i = 1:60
    if i<49
        xtrain(i) = x(i);
        ytrain(i) = y(i);
    else
        xtest(i-48) = x(i);
        ytest(i-48) = y(i);
    end
end

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
d = 1:7;
plot (d,train_er,'b-o',d,test_er,'r-o','LineWidth',2);
legend('train-er','test_er')
xlabel('degree')
ylabel('error')
