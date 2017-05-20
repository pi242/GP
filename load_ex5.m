load 'ex5data1.mat';

X_norm = [X];
y_norm = [y];
Xtest_norm = [Xtest];
ytest_norm = [ytest];
plot(Xtest_norm, ytest_norm, 'bx');
hold on;

theta = [326.8833; 17.3868]%; 1000]

%theta = [62.6596; 49.1613]

[m_post, cov_post, sd] = gprTrain(X_norm, y_norm, Xtest_norm, 1.0, theta);
plot_interpl(Xtest_norm, m_post, 20, 'g');
% plot_interpl(Xtest_norm, m_post + 2 * sd, 20, 'g');
% plot_interpl(Xtest_norm, m_post - 2 * sd, 20, 'g');
axis([-60 60 -10 60]);

%for measuring test error
sum((m_post - ytest_norm) .^ 2) / size(m_post, 1)

% 
% Mdl = LinearModel.fit(X_norm, y_norm, 'quadratic');
% yfit = predict(Mdl, Xtest_norm);
% figure;
% plot(Xtest_norm, ytest_norm, 'bx');
% hold on;
% plot_interpl(Xtest_norm, yfit, 20, 'r');
% title('pure qaudratic')
% sum((yfit - ytest_norm) .^ 2) / size(yfit, 1)



