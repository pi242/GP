function [m_post, cov_post, sd_pointwise] = gprTrain(X, y, x_star, SIGMA_N, theta)
dummy = cov_matrix(x_star, X, theta) * pinv(cov_matrix(X, X, theta) + (SIGMA_N ^ 2) * eye(size(X, 1)));
cov_post = cov_matrix(x_star, x_star, theta) - dummy * cov_matrix(X, x_star, theta);
m_post = dummy * y;
sd_pointwise = [];
for itr = x_star'
    sd_pointwise = [sd_pointwise; sqrt(cov_matrix(itr, itr, theta) - (cov_matrix(itr, X, theta) * inv(cov_matrix(X, X, theta) + (SIGMA_N ^ 2) * eye(size(X, 1))) * cov_matrix(X, itr, theta)))];
end

end