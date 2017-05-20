function [p, grad] = L_loo(theta)
% Cost function for 'leave one out cross validation '
[X_norm, y_norm] = data();

K = cov_matrix(X_norm, X_norm, theta);
K_inv = pinv(K);
alpha = K_inv * y_norm;
p = 0;
%grad = zeros(1, 2);
grad = zeros(size(theta, 1), 1);

% [gK1, gK2] = grad_K_sqexp(X_norm, X_norm, theta(1, 1), theta(2, 1));
[gK1, gK2, gK3] = grad_K_mmse(X_norm, X_norm, theta);

% dummy1 = (K_inv * gK1) * alpha;
% dummy2 = (K_inv * gK2) * alpha;
% dummy3 = (K_inv * gK1) * K_inv;
% dummy4 = (K_inv * gK2) * K_inv;

dummy1 = (K_inv * gK1) * alpha;
dummy1(:, :, 2) = (K_inv * gK2) * alpha;
dummy2 = (K_inv * gK1) * K_inv;
dummy2(:, :, 2) = (K_inv * gK2) * K_inv;

dummy1(:, :, 3) = (K_inv * gK3) * alpha;
dummy2(:, :, 3) = (K_inv * gK3) * K_inv;

for i = 1:size(X_norm, 1)
    ui = y_norm(i) - alpha(i) / K_inv(i, i);
    s2i = 1 / K_inv(i, i);
    p = p + (-1/2) * log(s2i) - ((y_norm(i) - ui) ^ 2) / (2 * s2i) - (1/2) * log(2 * pi);
    for j = 1:size(theta, 1)
        grad(j) = grad(j) + (alpha(i) * dummy1(i, 1, j) - (1/2) * (1 + (alpha(i) ^ 2) / K_inv(i, i)) * dummy2(i, i, j)) / K_inv(i, i);
    end
end

p = -1 * p
grad = -1 * grad;

end
