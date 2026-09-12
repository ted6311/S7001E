% Use the randn function in Matlab to generate a vector X of 100 independent samples
% from a Gaussian distribution with mean μ = 5 and variance σ2 = 3. (Sometimes we write
% X ∼ N (5, 3).)
clear; clc; 
X = 5 + sqrt(3)*randn(1,100);


%% a) Calculate the mean and variance of your realization of X. Do they agree with the theoretical mean and variance?

mean = mean(X);
variance = var(X);
disp('100 Points: ')
disp(['mean: ', num2str(mean)])
disp(['variance: ', num2str(variance)])

%% b) same but for 10 000 points:
clear;
X = 5 + sqrt(3)*randn(1,10000);
mean = mean(X);
variance = var(X);
disp('10 000 Points: ')
disp(['mean: ', num2str(mean)])
disp(['variance: ', num2str(variance)])


%% c) Histogram and theoretical pdf curve

figure; hold on; grid on; 
histogram(X, 'Normalization', 'pdf')



x = linspace(-2, 12, 1000);
pdf = (1/sqrt(2*pi*3)) * exp(-(x-5).^2/(2*3)); %pdf book page 89

plot(x, pdf, 'LineWidth', 2);

xlabel('X');
ylabel('Probability density');
title('Histogram and theoretical pdf');
legend('Histogram', 'Theoretical pdf');
grid on;

%% d) find points between 1<X<2? and Theoretical probability

a = find(X>=1 & X<=2);
a_len = length(a); 
fraction = a_len/length(X); 

disp(['Probability to get 1<X<2: ', num2str(fraction), ' = ', num2str(100*fraction),'%'])


% book 89-95
% integral dwedsd
