
clear;
clc; 

%% Q1

load("input_output.mat")

% matrix x = input
% matrix y = output


%% Q2
% 50 lags
l  = 50;

%auto correlation
figure;
[RXX, lags1] = xcorr(x, l);
stem(lags1,RXX)

figure;
[RYY, lags2] = xcorr(y, l);
stem(lags2,RYY)

%cross correlation
figure;
[RXY, lags3] = xcorr(x,y, l);
stem(lags3,RXY)