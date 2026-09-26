
clear; clc; 

% EXC 4
% N(3,2) gaussian:
N = 10000; 
X1 = randn(1,N);
X1 = 3 + sqrt(2)*X1; 

% N(1,1) gaussian:
X2 = randn(1,N);
X2 = 1 + X2;

Y1 = 0.5*X1 + 3*X2;
Y2 = X1 + X2; 

%% a) Expression for the joint pdf fX1X2 (x1, x2)?


%% b) mean, cov

mean_1 = mean(X1);
mean_2 = mean(X2);

C = cov(X1, X2);
C2 = corrcoef(X1, X2);
disp(['Mean X1 = ',num2str(mean_1) ])
disp(['Mean X2 = ',num2str(mean_2) ])
disp(['Cov(X1, X2) = ',num2str(C(1,2)) ])
disp(['p(X1, X2) = ',num2str(C2(1,2)) ])

%% c) scatter plot

figure; 

plot(X1, X2, '.');
grid on;
xlabel('X_1');
ylabel('X_2');
title('Scatter plot X_1 vs. X_2');

%% d) repeat a), b) and c) for Y1 and Y2


% b)
mean_1 = mean(Y1);
mean_2 = mean(Y2);

C1 = cov(Y1, Y2);
C22 = corrcoef(Y1, Y2);

disp('_')
disp('Part d)')

disp(['Mean Y1 = ',num2str(mean_1) ])
disp(['Mean Y2 = ',num2str(mean_2) ])
disp(['Cov(Y1, Y2) = ',num2str(C1(1,2)) ])
disp(['p(Y1, Y2) = ',num2str(C22(1,2)) ])

% c) 
figure; 

plot(Y1, Y2, '.');
grid on;
xlabel('Y_1');
ylabel('Y_2');
title('Scatter plot Y_1 vs. Y_2');


%% f)
int = @(v) (1/sqrt(2*pi)) * exp(-0.5 * v.^2) .* normcdf((4*sqrt(3)/5).*v - sqrt(6)/10);

int2 = integral(int, -1.1547, -0.5774);


%% g)
event = (Y2 > 2) & (Y2 < 3) & (Y1 > 5);
condition = Y1 > 5;

P_estimate = sum(event) / sum(condition);