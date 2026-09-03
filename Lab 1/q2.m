
clear; clc; 

%2 Modify to become four sided dice

function [a, b, roll, N] = roll_dice_4_sided(N)
    p = [0.1 0.2 0.4 0.3]; % probability of each face
    P = [0 cumsum(p)] ;
    roll = zeros(N,1); % vector to hold results of each roll

    for i=1:N % loop over number of rolls
        x=rand(1,1);
        for j=2:length(P) % determine result of each roll
            if( (P(j-1)<x) && (x<P(j)) )
                roll(i) = j-1;
                break
            end
        end
    end
    a = zeros(1,4);
    for i = 1:4
        a(i) = sum(roll == i);
    end
    b = a/N;

end

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
figure;
histogram(roll, 4,  'Normalization', 'probability')
xlabel("Side");
ylabel("estimated Probability");
title("Estimated vs Theoretical probability");