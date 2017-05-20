function k = mmse_cov(theta, xp, xq)
k = (theta(1, 1) ^ 2) * exp(-1 / (2 * (theta(2, 1) ^ 2)) * sum((xp - xq) .^ 2)) + (theta(3, 1) * xp' * xq);
end