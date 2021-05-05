function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
z = X*theta;
h =  1./(1 + exp(-z));
[rowsTheta, columnsTheta] = size(theta);
[rowsX, columnsX] = size(X);
CostRegTerm = (lambda/(2*m))*(theta(2:rowsTheta)'*theta(2:rowsTheta));
GradRegTerm = (lambda/m)*(theta(2:rowsTheta));

J = (1/m)*(-y'*log(h) - (1-y)'*log(1-h)) + CostRegTerm;
%grad = (1/m)*(h-y)'*X(:,1);
% grad = (1/m)*(h-y)'*X + GradRegTerm;

for j = 1:columnsX
    if j ==1
        grad(j) = (1/m)*((h-y)'*X(:,j));
    else
        grad(j) = (1/m)*((h-y)'*X(:,j)) + (lambda/m)*theta(j);
    end
end



% z = [];
% h = [];
% z = X*theta;
% h =  1./(1 + exp(-z));
% for i = 1:size(X(:,1))
%         if i == 1
%         J = (1/m)*(-y'*log(h) - (1-y)'*log(1-h))
%         grad = (1/m)*((h-y)'*X);
%     else
%         J = (1/m)*(-y'*log(h) - (1-y)'*log(1-h)) + (lambda/(2*m))*(theta'*theta)
%         grad = (1/m)*(h-y)'*X + (lambda/m)*(theta);
%     end
% end



% [rows, columns] = size(theta);
% 
% z = X*theta;
% h =  1./(1 + exp(-z));
% 
% J = (1/m)*(-y'*log(h) - (1-y)'*log(1-h))
% grad = (1/m)*(h-y)'*X + (lambda/m)*(theta)
% regTerm = (lambda/(2*m))*(theta'*theta);
% for i = 1:rows
%     for j = 2:columns
%         if i == 1
%             J = (1/m)*(-y'*log(h) - (1-y)'*log(1-h)) + regTerm;
%             grad = (1/m)*(h-y)'*X + (lambda/m)*(theta);
%         end
%     end
% end    
    




% =============================================================

end
