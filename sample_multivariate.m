function sample = sample_multivarate(m, K)
%SAMPLE = sample_multivarate(m, K)
%fn to return array of samples drawn from multivariate gaussian dist with
%mean vector m and cov matrix K

K = K + eye(size(K));
L = chol(K);
u = randn([size(m, 1), 1]);
sample = m + L * u;
end