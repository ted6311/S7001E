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
disp(['Theoretical probability: ', num2str(a1)])


%% b) Simulate transmission of many blocks of 100 bits over the channel. Does the fraction
% of blocks that contain 2 or fewer errors agree with your theoretical result in (a)?



[number, roll , x, N] = bits(100);

fraction = number/N;

disp(['Simulated probability: ', num2str(fraction)])
disp(['percent: ', num2str(100*fraction), '%'])


%% c) Determine the theoretical probability that there were no errors in a block of 100 bits,
% given that less than 2 errors occurred when transmitting the block.

a=P^100;
b=100*P^99*P_error;
a1 = a/(a+b);
disp(['Theoretical probability:', num2str(a1)])

