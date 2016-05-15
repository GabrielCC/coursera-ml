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

z = sigmoid(X * theta);
s = sum( -1 * y' * log(z) - (1 - y') * log(1 - z) );
theta_sum = sum(power(theta, 2)) - power(theta(1), 2);
J = s / m + theta_sum * lambda / (2 * m);

grad = ( X' * ( z - y) ) / m;

grad_1 = grad(1);
grad = grad + theta * lambda / m;
grad(1) = grad_1;





% =============================================================

end
