function plot_interpl(x, y, NUM, color)
plot(interp1(1:size(x, 1), x, linspace(1, size(x, 1), NUM * size(x, 1))), interp1(x, y, interp1(1:size(x, 1), x, linspace(1, size(x, 1), NUM * size(x, 1)))), color);
xlabel('input x');
ylabel('output y');
end