SIGMA_F = 1;
L = 1;
x = [0:15]' / 3;
cov_prior = cov_matrix(x, x, SIGMA_F, L);
f_prior = sample_multivariate(zeros(size(x, 1), 1), cov_prior);

plot(x, f_prior, 'r+', 'MarkerSize', 10);
ylim([-5, 5]);
hold on;

plot_interpl(x, 2 * diag(cov_prior), 20);   
plot_interpl(x, -2 * diag(cov_prior), 20);
plot_interpl(x, zeros(size(x, 1), 1), 20);
