clear; clc;

[X, fs] = audioread('newspapers.wav');

left_channel  = X(:, 1);
right_channel = X(:, 2);
