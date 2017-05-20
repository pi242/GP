function K = cov_matrix(X1, X2, theta)
%K = cov_matrix(X1, X2, sigma_f, l)
%fn to return covariance matrix for two arrays X1 and X2
%squared exponential covariance funcction with hyperparameters sigma_f and l
m = size(theta, 1);
for itr1 = 1:size(X1, 1)
    for itr2 = 1:size(X2, 1)
        if m == 2
            K(itr1, itr2) = sq_exp(theta(1, 1), theta(2, 1), X1(itr1), X2(itr2));
        else if m == 3
                K(itr1, itr2) = mmse_cov(theta, X1(itr1), X2(itr2));
            end
        end
        %K(itr1, itr2) = X(itr2) - X(itr1);
    end
end
end