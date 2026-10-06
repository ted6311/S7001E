
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

[RXX, lags1] = xcorr(x, l);
% figure;
% stem(lags1,RXX)


[RYY, lags2] = xcorr(y, l);
% figure;
% stem(lags2,RYY)

%cross correlation

[RXY, lags3] = xcorr(x,y, l);
% figure;
% stem(lags3,RXY)



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



%% Q3 power spectral densities
N = 10000;
SXX = fft(RXX, N);
SYY = fft(RYY, N);

w = linspace(-pi, pi, N);

figure; 

subplot(2,1,1)
plot(w,real(SXX))
title('psd S_{XX}(\omega) [-\pi \leq \omega \leqq \pi ]')
xlim([-pi pi]);
xlabel('\omega')
ylabel('S_{XX}(\omega)')

subplot(2,1,2)
plot(w,real(SYY))
title('psd S_{YY}(\omega) [-\pi \leq \omega \leqq \pi ]')
xlim([-pi pi]);
xlabel('\omega')
ylabel('S_{YY}(\omega)')