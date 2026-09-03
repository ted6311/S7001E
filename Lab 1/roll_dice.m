function [a, b, roll, N] = roll_dice(N)
    p = [1/6 1/6 1/6 1/6 1/6 1/6 ]; % probability of each face
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
    a = zeros(1,6);
    for i = 1:6
        a(i) = sum(roll == i);
    end
    b = a/N;

end
