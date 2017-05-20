function [gK1, gK2] = grad_K_sqexp(X1, X2, sigma_f, l)
%gradient of sq exp cov fn wrt theta
for itr1 = 1:size(X1, 1)
    for itr2 = 1:size(X2, 1)
        gK1(itr1, itr2) = (2 / sigma_f) * sq_exp(sigma_f, l, X1(itr1, :), X2(itr2, :));
        gK2(itr1, itr2) = (sum((X1(itr1, :) - X2(itr2, :)) .^ 2) / (l ^ 3)) * sq_exp(sigma_f, l, X1(itr1, :), X2(itr2, :));
        %K(itr1, itr2) = X(itr2) - X(itr1);
    end
end
end
