function [X1, y1] = data()
% load 'ex6data1.mat';
%  X1 = [X];%; Xval];
%  y1 = [y];
% X_norm = [X];%; Xval];
% y_norm = [y];%; yval];
% X_norm = (X_norm - min(X_norm)) ./ (max(X_norm) - min(X_norm));
% y_norm = (y_norm - min(y_norm)) ./ (max(y_norm) - min(y_norm));
% 
% X1 = [X_norm];
% y1 = [y_norm];


% load 'ex6data3.mat';
% X_norm = [X(1:10, :)];%; Xval];
% y_norm = [y(1:10, :)];%; yval];
% for i = 1:10%size(X, 1)
%     X1(i, :) = (X_norm(i, :) - min(X_norm)) ./ (max(X_norm) - min(X_norm));
%     y1(i, :) = (y_norm(i, :) - min(y_norm)) ./ (max(y_norm) - min(y_norm));
% end

 X1 = (-16:15)';
 y1 = [-1 * ones(1, 16), +1 * ones(1, 16)]';

end