% Matlab codes to study Monte Carlo example in LTspice
clear
index = [0 1 2 3]
B_matrix = 0;
for i=0:1:16
    for k=0:3
        B_matrix(k+1,i+1) = floor(i/2^k) - 2*floor(i/2^(k+1));
    end
end

%  --   combnk   -- 

v = [0 1];
C = combnk(v,k) % returns all combinations of the n elements in v taken k at a time.
