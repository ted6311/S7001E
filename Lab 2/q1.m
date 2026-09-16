% Exc 1 

clear; clc; 


%% a) Write a short program to generate N = 10000 points

N = 10000; 
Y = rand(N,1);
X = zeros(size(Y));
a = Y<0.5;
b = Y >= 0.5; 
X(a) = -1+sqrt(2*Y(a));
X(b) = 1 - sqrt(2*(1-Y(b)));





%% b) hist and theoretical pdf
figure; grid on; hold on; 
histogram(X,53,'Normalization','pdf')
 
x = linspace(-3,3, 1000); 
y = zeros(size(x));
a1 = (x>= -1) & (x<0);
b1 = (x>= 0) & (x<=1);

y(a1) = 1+x(a1);
y(b1) = 1-x(b1);

plot(x, y, 'r-', 'LineWidth', 2)

title('X vs pdf')
xlabel('x')
ylabel('f_X(x)')
legend('Histogram', 'pdf')