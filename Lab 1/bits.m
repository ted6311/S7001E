function [number, roll,x, N] = bits(N)
P = [0.001, 0.999];
P = [0 cumsum(P)];
roll = zeros(N,100); % vector to hold results of each roll
matrix = round(rand(1,100));
for k = 1:N
    for i=1:100 % loop over number of rolls
        x=rand(1,1);
        if x < P(2) 
            roll(k,i) = 0;
        else
            roll(k,i) = 1;
        end
    end
end
x = zeros(1,N); 
for i = 1:N
    index = find(roll(i,:) == 0);

    if ~isempty(index)
        x(i) = length(index);
    else
        x(i) = 0;
    end
end

number = sum(x <= 2);

end