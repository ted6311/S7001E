mu = [4.5, 4];
Sigma = [9.5, 4; 4, 3];
% P(5 < Y1 < inf , 2 < Y2 < 3)
p_joint = mvncdf([5, 2], [inf, 3], mu, Sigma);
p_b = 1 - normcdf(5, 4.5, sqrt(9.5));
p_cond = p_joint / p_b;