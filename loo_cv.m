initial_theta = [1; 1; 1];
options = optimset('MaxIter', 200, 'GradObj', 'on');
theta = fminunc(@L_loo, initial_theta, options);
%theta = fminunc(@L_loo, theta0);