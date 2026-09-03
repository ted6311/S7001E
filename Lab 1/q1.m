
clear; clc; 

%% a)

[a,b, roll, N] = roll_dice(1000);
disp("Fraction/side"), disp(b)
% Function works
% And we get the fraction for each occurence

%% b) 

%Hist

figure; grid on; 
hist(roll, 6)
xlabel("bins")
ylabel("Throws")


%PDF
P = [1/6 1/6 1/6 1/6 1/6 1/6 ];
figure; 
bar(P);
xlabel("Side")
ylabel("Theoretical Probability")

%% c) scale the hist-diag properly so we got estimate of PDF
figure;
histogram(roll, 6,  'Normalization', 'probability')
xlabel("Side");
ylabel("estimated PDF");

