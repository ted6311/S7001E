
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


figure;

subplot(3,1,1)
stem(lags1, RXX, 'filled');
grid on;
xlabel('Lag k');
ylabel('R_{XX}[k]');
title('Auto-correlation R_{XX}[k]');

subplot(3,1,2)
stem(lags2, RYY, 'filled');
grid on;
xlabel('Lag k');
ylabel('R_{YY}[k]');
title('Auto-correlation R_{YY}[k]');

subplot(3,1,3)
stem(lags3, RXY, 'filled');
grid on;
xlabel('Lag k');
ylabel('R_{XY}[k]');
title('Cross-correlation R_{XY}[k]');