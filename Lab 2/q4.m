
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