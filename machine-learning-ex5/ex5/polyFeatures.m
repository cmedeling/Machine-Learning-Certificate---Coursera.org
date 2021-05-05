function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%


% You need to return the following variables correctly.
X_poly = zeros(numel(X), p);

% ====================== YOUR CODE HERE ======================
% Instructions: Given a vector X, return a matrix X_poly where the p-th 
%               column of X contains the values of X to the p-th power.
%
% 
for j = 1:p
  for i = 1:numel(X)
##   1.  What does the hypothesis look like?
##     theta0 + theta1*X1 + theta2*(X1)^2 + theta3*(X1)^3 + .... + thetap*(X1)^p
##
##   2. What are we making?
##     x_poly = [X
##              X^2
##              X^3
##              .
##              .
##              X^p]
##
##  3. code
  
  X_poly(i,j) = X(i)^j;
end

##for i = 1:p
##  X_poly = bsxfun(@power, X, 1:p);
##end




% =========================================================================

end
