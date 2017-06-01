function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%


% You need to return the following variables correctly.
X_poly = zeros(size(X,1), (size(X,2)*p));

% ====================== YOUR CODE HERE ======================
% Instructions: Given a vector X, return a matrix X_poly where the p-th 
%               column of X contains the values of X to the p-th power.
%
% 

for i = 1:size(X,1)
  c=1;
  for k = 1:size(X,2)
      for j = 1:p
        X_poly(i,c) = X(i,k).^j;
        c = c+1;
      end
  end
end





% =========================================================================

end
