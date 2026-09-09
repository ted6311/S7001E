clear; clc; 
% EXC 4

%error bit (0.1%): To say 1/1000
P_error = 0.001; 
P = 0.999;



%% a) Theoretical probability of 2 or fewer errors in the transmission of 100 bits

%prob to get 0,1,2 wrong out of 100 bits:
a=P^100;
b=P^99*P_error;
c=P^98*P_error^2;

% but we need to find every possible combination for b and c
a=a;
b=b*100;
c=100*99*c/2;
a1 = a+b+c;



%% b) Simulate transmission of many blocks of 100 bits over the channel. Does the fraction
% of blocks that contain 2 or fewer errors agree with your theoretical result in (a)?

P = [0.001, 0.999];
P = [0 cumsum(P)];





A = [1, 2, 0; 0, 1, 2; 4, 3, 0];
A1 = [1;2;3]
A2 = length(A1)
x = find(A(3, :)==0);

[a, b, roll, N] = bits(100);