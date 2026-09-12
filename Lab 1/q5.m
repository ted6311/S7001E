% Use the randn function in Matlab to generate a vector X of 100 independent samples
% from a Gaussian distribution with mean μ = 5 and variance σ2 = 3. (Sometimes we write
% X ∼ N (5, 3).)
clear; clc; 
X = 5 + sqrt(3)*randn(1,100);


%% a) Calculate the mean and variance of your realization of X. Do they agree with the theoretical mean and variance?

mean = mean(X);
variance = var(X);

disp(['mean: ', num2str(mean)])
disp(['variance: ', num2str(variance)])