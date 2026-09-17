clear; clc; 


% EXC 3

% Generate N = 10 000 points drawn from a Gaussian distributed x ~N(3,2)

N = 10000; 

x = randn(1, N);
% 3 = mean
% sigma^2 =2 = variance 
% x = sqrt(2)*x;
% x = x + 3;

%% a) histogram as an estimate of the pdf f_X(x)

x_var = var(x);
x_mean = mean(x);

figure; 
histogram(x, 'Normalization','pdf')
xlabel('x')
ylabel('f_{X}(x)')

%% b) Try a variety of values for N and number of bins in the histogram.

N = [1000, 100000, 1000000, 10000000];
bins = [10, 20, 50, 100];
figure;
for i = 1 : 4
    x = randn(1 ,N(i));
    x = 3 + sqrt(2)*x;
    subplot(2,2,i);
    histogram(x, bins(i), 'Normalization','pdf')
    xlabel('x')
    ylabel('f_{X}(x)')
    title("f_{X}(x) for N = "+ num2str(N(i)) + " points, and " + num2str(bins(i)) + " bins")
end