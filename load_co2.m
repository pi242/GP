load 'co2.txt'
data= [];
for i = 1:size(co2, 1)
    data = [data; [(co2(i, 1)) * ones(12, 1), co2(i, 2:13)']];
end
data_2 = []
data_2 = [data_2, data(3:73, :)];
data_2 = [data_2; data(77:end, :)];
;digits(7);      
for k = 1:size(data_2, 1)
   data_2(k, 1) = data_2(k, 1) + mod(k, 12) / 12;
end
plot(data_2(:, 1), data_2(:,  2));