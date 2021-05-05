function [p,ind] = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               
%               YOU SHOULD SET P TO A VECTOR OF PREDICTIONS (FROM 1 TO
%               NUM_LABELS).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       
z = X*all_theta';        % output is 5000x10 matrix
h = 1./(1+exp(-z));      % output is 5000x10 matrix

% Now find the max value and INDEX of max value which is the probability
% that that row belongs to a particular digit/integer.

[maxh, p] = max(h, [], 2); % this asks for the maximum prediction for each
                           % row of h, ie. the likelihood that each row 
                           % represents a particular integer, and also it's
                           % position (column), representing the particular
                           % integer.  Since the function only returns one
                           % value, the only variable returned is the
                           % number that row represents.









% =========================================================================


end
