function obs = gen_obs(N)
%obs = gen_obs(N)
%fn to generate NX2 matrix of random numbers with x in [0, 5]
x_obs = 5 * rand([N, 1]);
x_obs = sort(x_obs);
f = sample_multivariate(zeros(size(x_obs, 1), 1), cov_matrix(x_obs, x_obs, 1, 1));
obs = [x_obs, f];
%plot(obs(:, 1), obs(:, 2), 'bx');
end