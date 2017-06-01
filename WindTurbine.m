% Loading required data from Wind Turbine one

%% Initialization
clear ; close all; clc

turbine_data = csvread('turbines.csv', 1, 0);
shuffled_activeP = turbine_data(2:end,2);
shuffled_ambientTemp = turbine_data(2:end,3);
shuffled_hydraulicOilTemp = turbine_data(2:end,4);
shuffled_phaseCurrentA = turbine_data(2:end,5);
shuffled_phaseCurrentB = turbine_data(2:end,6);
shuffled_phaseCurrentC = turbine_data(2:end,7);
shuffled_phaseVoltageA = turbine_data(2:end,8);
shuffled_phaseVoltageB = turbine_data(2:end,9);
shuffled_phaseVoltageC = turbine_data(2:end,10);
shuffled_reactiveP = turbine_data(2:end,11);
shuffled_turbineStatus = turbine_data(2:end,11);
shuffled_windD = turbine_data(2:end,13);
shuffled_windS = turbine_data(2:end, 14);



X_default =  [shuffled_ambientTemp,shuffled_hydraulicOilTemp,...
    shuffled_phaseCurrentA,shuffled_phaseCurrentB,shuffled_phaseCurrentC,...
    shuffled_phaseVoltageA,shuffled_phaseVoltageB,shuffled_phaseVoltageC,...
    shuffled_turbineStatus,shuffled_windD,shuffled_windS];
    

p = 5;  
X_poly_default = polyFeatures(X_default, p); 


%Normalize
[shuffled_activeP, mu, sigma] = FeatureNormalizeN(shuffled_activeP);
[shuffled_reactiveP, mu, sigma] = FeatureNormalizeN(shuffled_reactiveP);
[X_poly_default, mu, sigma] = FeatureNormalizeN(X_poly_default);

%Compute the apparent power of the whole dataset
[apparentP] = ApparentPower(shuffled_activeP, shuffled_reactiveP);



%Number of rows of all features
n = size(X_default,1);
%m= size(X,1);

%Assign traning, validation and testing data set
X = [X_poly_default(1:3391,:)];  
y = apparentP(1:3391,:);
Xval  = [X_poly_default(3392:4521,:)];     
yval = apparentP(3392:4521,:);
Xtest = [X_poly_default(4522:n,:)];   
ytest = apparentP(4522:n,:);



%Cost Function
theta = ones((size(X,2)+1),1);
[J, grad] = linearRegCostFunction([ones(size(X,1),1),X], y, theta, 1);
fprintf('Cost Function for Polynomial TRAIN SET at initial Theta is : %f\n', J);
[J, grad] = linearRegCostFunction([ones(size(Xval,1),1),Xval], yval, theta, 1);
fprintf('Cost Function for Polynomial VAL SET at initial Theta is : %f\n\n', J);

%  Train linear regression with lambda = 0
lambda = 0;
[theta] = trainLinearReg([ones(size(X,1),1),X], y, lambda);
[J, grad] = linearRegCostFunction([ones(size(X,1),1),X], y, theta, 1);
fprintf('Cost Function for Polynomial TRAIN SET at trained Theta(lambda = 0) is : %f\n', J);
[J, grad] = linearRegCostFunction([ones(size(Xval,1),1),Xval], yval, theta, 1);
fprintf('Cost Function for Polynomial VAL SET at trained Theta(lambda = 0) is : %f\n', J);
[J, grad] = linearRegCostFunction([ones(size(Xtest,1),1),Xtest], ytest, theta, 1);
fprintf('Cost Function for Polynomial TEST SET at trained Theta(lambda = 0) is : %f\n', J);




%=================Compute the max error from test set=======================
Xtest_bias = [ones(size(Xtest,1),1),Xtest];
apparentP_test = zeros(size(Xtest,1),1);
percentage_error = zeros(size(Xtest,1),1);

%predicted apparent power from test set using trained theta
for i = 1:size(Xtest,1)
  apparentP_test(i) = Xtest_bias(i,:)*theta;
end

%computing percentage error in predicted apparent power
for i = 1:size(Xtest,1)
  percentage_error(i) = ((((apparentP_test(i) - ytest(i))/apparentP_test(i)).^2)/2)*100;
end


  


