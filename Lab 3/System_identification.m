
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
SXX = fft(ifftshift(RXX), N);

SYY = fft(ifftshift(RYY), N);
SXX = fftshift(SXX);
SYY = fftshift(SYY);
w = linspace(-pi, pi, N);
% SXX = real(SXX);
% SYY= real(SYY);
figure; 


SXX = abs(SXX);
SYY = abs(SYY);


subplot(2,1,1)
plot(w,SXX)
title('psd S_{XX}(\omega) [-\pi \leq \omega \leqq \pi ]')
xlim([-pi pi]);
xlabel('\omega')
ylabel('S_{XX}(\omega)')

subplot(2,1,2)
plot(w,SYY)
title('psd S_{YY}(\omega) [-\pi \leq \omega \leqq \pi ]')
xlim([-pi pi]);
xlabel('\omega')
ylabel('S_{YY}(\omega)') 



%% Q4

M = 2: 20 ; 
MSE = zeros(1, length(M)); 


% Auto / Cross
[RXX, lags] = xcorr(x ,l); 
[RYX, lags1] = xcorr(y, x, l); 

% Only for positive k vals, as only we want M>=0
RXX_pos = RXX(lags >= 0);
RYX_pos = RYX(lags1 >= 0);




for i =  1:length(MSE)

    M_valuse = M(i); 

    % R matrix
    R = zeros(M_valuse+1); 
    for row = 1: M_valuse + 1
        for col = 1:M_valuse + 1
            j = abs(row-col) + 1; 
            R(row, col) = RXX_pos(j);
        end
        
    end



    % P-matrix
    P = RYX_pos(1:M_valuse+1); 

    % P=R*H
    H = R\P;  
    

    % y_hat
    y_hat = zeros(size(y)); 

    for n = M_valuse+1:length(x)

        sum = 0;

        for k = 0:M_valuse
            sum = sum + H(k+1) * x(n-k);
        end

        y_hat(n) = sum;

    end


    %MSE
    error_sum = 0;
    
    for n = M_valuse+1:length(y)

        error = y(n) - y_hat(n);

        error_sum = error_sum + error^2;

    end

    MSE(i) = error_sum / (length(y) - M_valuse);


end


figure;
plot(M, MSE, 'o-');

grid on;

xlabel('M');
ylabel('MSE');

title('Mean-square error vs M');