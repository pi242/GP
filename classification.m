% load 'ex6data1.mat';
% %plotData_class(X(1:20, :), y(1:20, :));
% %figure;
% plotData_class(X, y);
% hold on;
% 
% theta = [-0.0000; 1.0000; 1.0000];
% 
% [m_post, cov_post, sd] = gprTrain(X(1:40, :), y(1:40, :), X(41:end, :), 1.0, theta);
% y(41:end)
% m_post
% %plotData_class(X(201:end), m_post);
% %plot(X(201:end, :), m_post, 'go')
[X, y] = data();
size(X)
size(y)
plot(X, y);
hold on;
 theta = [49.8545; 1.7020; -2.7208];
%theta = [0.9384; 1.0099; 0.1715];
xtest = [-50:50]' / 5
[m_post, cov_post, sd] = gprTrain(X, y, xtest, 1.0, theta);
plot(xtest, m_post, 'go');