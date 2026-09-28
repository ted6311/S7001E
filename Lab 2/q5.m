clear; clc;

[X, fs] = audioread('newspapers.wav');

left_channel  = X(:, 1);
right_channel = X(:, 2);

%% d) 

% Expected value of L^2, R^2 and LR
L2 = mean(X(1:100,1).^2);
R2 = mean(X(1:100,2).^2);
LR = mean(X(1:100,1).*X(1:100,2));



%% e) and f)

lambda = 0.99995;
u = 10^(-5);
k = 0;


for i = 101:length(X)

    L2 = (1-lambda)*X(i,1)^2 + lambda*L2;
    LR = (1-lambda)*X(i,1)*X(i,2) + lambda*LR;
    R2 = (1-lambda)*X(i,2)^2 + lambda*R2;

    dQ = 4*LR^2*k^3 ...
        + 6*LR*(L2+R2)*k^2 ...
        + 2*((L2+R2)^2 + 2*LR^2)*k ...
        + 2*LR*(L2+R2);

    k = k - u*sign(dQ);

end

%% g) 


lambda = 0.99995;
u = 10^(-5);


k = 0;


k_values = zeros(length(X),1);



for i = 101:length(X)


    L2 = (1-lambda)*X(i,1)^2 + lambda*L2;
    LR = (1-lambda)*X(i,1)*X(i,2) + lambda*LR;
    R2 = (1-lambda)*X(i,2)^2 + lambda*R2;

    dQ = 4*LR^2*k^3 ...
        + 6*LR*(L2+R2)*k^2 ...
        + 2*((L2+R2)^2 + 2*LR^2)*k ...
        + 2*LR*(L2+R2);


    k = k - u*sign(dQ);

    k_values(i) = k;

end

% Check if minimize
dq2 = 4*LR^2*k^3 ...
    + 6*LR*(L2+R2)*k^2 ...
    + 2*((L2+R2)^2 + 2*LR^2)*k ...
    + 2*LR*(L2+R2);

X_hat = X(:,1) + k_values .* X(:,2);
Y_hat = k_values .* X(:,1) + X(:,2);

figure;
plot(k_values);
xlabel('Sample');
ylabel('k');
title('Estimated k over iterstions');
grid on;


%% h)

% audiowrite('sep_newspaper1.wav', X_hat/max(abs(X_hat)), fs);
% audiowrite('sep_newspaper2.wav', Y_hat/max(abs(Y_hat)), fs);