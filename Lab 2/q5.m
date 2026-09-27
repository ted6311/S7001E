clear; clc;

[X, fs] = audioread('newspapers.wav');

left_channel  = X(:, 1);
right_channel = X(:, 2);

%% d) 

% Expected value of L^2, R^2 and LR
L2 = mean(X(1:100,1).^2);
R2 = mean(X(1:100,2).^2);
LR = mean(X(1:100,1).*X(1:100,2));