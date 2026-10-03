clear; clc;

A = [30, 18, 15; 
    18, 30, 18;
    15, 18, 30];
B = [18; 15; 6];

a = A\B;
disp(['a0 = ', num2str(a(1))])
disp(['a_1 = ', num2str(a(2))])
disp(['a_2 = ', num2str(a(3))])
