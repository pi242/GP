function [gK1, gK2, gK3] = grad_K_mmse(X1, X2, theta)
%gradient of sq exp cov fn wrt theta
for itr1 = 1:size(X1, 1)
    for itr2 = 1:size(X2, 1)
        gK1(itr1, itr2) = (2 / theta(1, 1)) * sq_exp(theta(1, 1), theta(2, 1), X1(itr1, :), X2(itr2, :));
        gK2(itr1, itr2) = (sum((X1(itr1, :) - X2(itr2, :)) .^ 2) / (theta(2, 1) ^ 3)) * sq_exp(theta(1, 1), theta(2, 1), X1(itr1, :), X2(itr2, :));
        gK3(itr1, itr2) = sum((X1(itr1, :) - X2(itr2, :)) .^ 2);
        %K(itr1, itr2) = X(itr2) - X(itr1);
    end
end
end
