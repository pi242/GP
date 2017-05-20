data = load('ex1data1.txt');
%{
for itr = 1:size(data, 1)
    data(itr, :) = (data(itr, :) - mean(data)) ./ max(data);
end
data;
%}
num_samples = 10;
D = [];
randi(size(data, 1), [num_samples, 1]);
for i = 1:num_samples
    D = [D; data(i, :)];
end
D;