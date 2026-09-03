
clear; clc; 

%2 Modify to become four sided dice



[a,b, roll, N] = roll_dice_4_sided(1000);

%% a) repeat 1a) for this 4 sided dice

disp("Fraction/side"), disp(b)
% Function works
% And we get the fraction for each occurence


%% b) repeat 1b)

%Hist

figure; grid on; 
hist(roll, 4)
xlabel("bins")
ylabel("Throws")


%PDF
P = [0.1 0.2 0.4 0.3]; 
figure; 
bar(P);
xlabel("Side")
ylabel("Theoretical Probability")

%% c) 
figure; grid on; 
h = hist(roll, 4);
h = h / sum(h);
h = cumsum(h);
bar(h)

xlabel("Side");
ylabel("estimated Probability");
title("Estimated vs Theoretical probability");