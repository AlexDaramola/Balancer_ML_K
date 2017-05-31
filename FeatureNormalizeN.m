function [X_norm, mu, sigma] = FeatureNormalizeN(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
%data = load('ex1data2.txt');
%y = data(:,3);
%m = length(y); % number of training examples
X_norm = X;
mu = mean(X); %taking the mean of each features
sigma = std(X); %taking the standard deviation of each features

% ====================== YOUR CODE HERE ======================

mu_matrix = (ones(size(X,1),1)).*mu; 
sigma_matrix = (ones(size(X,1),1)).*sigma;

% normalizing 
X_norm = ((X - mu_matrix)./sigma_matrix);

% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       









% ============================================================

end
