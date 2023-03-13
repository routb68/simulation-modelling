clc
clear variables
close all
%% Load the dataset
data = readtable('C:\Users\SHUBHAM\Downloads\data_prob_6.xlsx');
x= data.x;
y= data.y;

% Shuffle the dataset randomly
rng(123);
idx = randperm(length(x));
%%x_idx = x(idx);
%%y_idx = y(idx);

% Define the number of folds and polynomial degree
k = 6;
degree = 4;

% Initialize the list to store the MSE for each iteration
mse_list = [];

% Perform k-fold analysis
for i = 1:k
    % Split the data into training and testing sets
    test_start = 1 + (i-1)*10;
    test_end = i*10;
    X_test = x(test_start:test_end);
    y_test = y(test_start:test_end);
    X_train = x;
    X_train(test_start:test_end) = [];
    y_train = y;
    y_train(test_start:test_end) = [];
    
    % Fit a polynomial regression model to the training data
    poly_features = polyfit(X_train, y_train, degree);
    
    % Evaluate the model on the testing data
    y_pred = polyval(poly_features, X_test);
    mse = mean((y_test - y_pred).^2);
    mse_list(i) = mse;
end
mse_list
% Compute the average MSE across all iterations
avg_mse = mean(mse_list);
disp(['Average MSE: ' num2str(avg_mse)]);
