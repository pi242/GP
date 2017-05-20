load 'slump_test.data'
data_norm = zeros(size(slump_test));
for itr = 1:size(slump_test, 1)
data_norm(itr, :) = (slump_test(itr, :) - min(slump_test)) ./ (max(slump_test) - min(slump_test));
end

SIGMA_N = 1.0;
sigma_f = 1.0;
l = 1.0;
obs = [];
obs = [obs; data_norm(1:70, :)];
x = data_norm(71:103, 1:8);
dummy = cov_matrix(x, obs(:, 1:8), sigma_f, l) * inv(cov_matrix(obs(:, 1:8), obs(:, 1:8), sigma_f, l) + (SIGMA_N ^ 2) * eye(size(obs(:, 1:8), 1)));
cov_post = cov_matrix(x, x, sigma_f, l) - dummy * cov_matrix(obs(:, 1:8), x, sigma_f, l);
m_post = dummy * obs(:, 10);

f_post = sample_multivariate(m_post, cov_post);
%{
figure;
plt = plot(x, f_post, 'k+', 'MarkerSize', 10);
ylim([-5, 5]);
%}
%hold on;

plot_interpl(x(:, 1), m_post, 20);
hold on;
plot(x(:, 1), data_norm(71:103, 10), 'rx');

%hold on;

sd = [];
for itr = 1:size(x, 1)
    sd = [sd; sqrt(cov_matrix(x(itr, :), x(itr, :), sigma_f, l) - (cov_matrix(x(itr, :), obs(:, 1:8), sigma_f, l) * inv(cov_matrix(obs(:, 1:8), obs(:, 1:8), sigma_f, l) + (SIGMA_N ^ 2) * eye(size(obs(:, 1:8), 1))) * cov_matrix(obs(:, 1:8), x(itr, :), sigma_f, l)))];
end

plot_interpl(x(:, 1), m_post + 2 * sd, 20); 
plot_interpl(x(:, 1), m_post - 2 * sd, 20); 

%plot(obs(:, 1), obs(:, 2), 'b*', 'MarkerSize', 5);

sum((m_post - data_norm(71:103, 10)) .^ 2) / (103 - 71 + 1)

Mdl = LinearModel.fit(obs(:, 1:8), obs(:, 10), 'linear');
yfit = predict(Mdl, x);
sum((yfit - data_norm(71:103, 10)) .^ 2) / (103 - 71 + 1)
plot(x(:, 1), yfit, 'b+');
