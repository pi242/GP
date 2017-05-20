function [x, y] = load_ex1()
    A = load('ex1data1.txt');
    x = [A(:, 1)];
    y = [A(:, 2)];
end