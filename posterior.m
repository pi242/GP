SIGMA_N = 0.7;
obs = [];
obs = [obs; gen_obs(20)];

dummy = cov_matrix(x, obs(:, 1), 1, 1) * inv(cov_matrix(obs(:, 1), obs(:, 1), 1, 1) + (SIGMA_N ^ 2) * eye(size(obs(:, 1), 1)));
cov_post = cov_matrix(x, x, 1, 1) - dummy * cov_matrix(obs(:, 1), x, 1, 1);
m_post = dummy * obs(:, 2);
f_post = sample_multivariate(m_post, cov_post);

figure;
plt = plot(x, f_post, 'k+', 'MarkerSize', 10);
ylim([-5, 5]);
hold on;

plot_interpl(x, m_post, 20); 

sd = [];
for itr = x'
    sd = [sd; sqrt(cov_matrix(itr, itr, 1, 1) - (cov_matrix(itr, obs(:, 1), 1, 1) * inv(cov_matrix(obs(:, 1), obs(:, 1), 1, 1) + (SIGMA_N ^ 2) * eye(size(obs(:, 1), 1))) * cov_matrix(obs(:, 1), itr, 1, 1)))];
end

plot_interpl(x, m_post + 2 * sd, 20); 
plot_interpl(x, m_post - 2 * sd, 20); 

plot(obs(:, 1), obs(:, 2), 'b*', 'MarkerSize', 5);

