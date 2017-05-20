function k = sq_exp(sigma_f, l, xp, xq)
%k = sq_exp(sigma_f, l, xp, xq)
%fn to return value of SE cov fn for arrays/ scalars xp and xq with
%hyperparameters sigma_f and l
k = (sigma_f ^ 2) * exp(-1 / (2 * (l ^ 2)) * sum((xp - xq) .^ 2));
end