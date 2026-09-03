% EXC 3

clear; clc; 

%% a) #1 + #2 = even

%Theoretical possibilty = 50%




%% b)
[a,b, roll, N] = roll_dice(10000);
[a1,b2, roll2, N2] = roll_dice_4_sided(10000);

% x = zeros(1, N);
x = 0; 
for i = 1:N
    x1 = roll(i) + roll2(i);
    if mod(x1, 2) == 0
       x =x + 1;
    else
        continue
    end
    
end
 
disp(['Probability to get even: ', num2str(100*(x/N)), '%'])


%% c)
% Probability is 35%

%% d)

x = 0; 
x1 = 0; 
for i = 1:N
    x1 = roll(i) + roll2(i);
    if mod(x1, 2) == 0 && roll2(i) > 2
        x = x + 1;
    else
        continue
    end

end

disp(['Probability to get even and that die #2 > 2: ', num2str(100*(x/N)), '%'])