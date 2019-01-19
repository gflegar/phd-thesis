% Input  : m x m matrix L, rhs vector b
% Output : Vector b overwritten by the solution y 
%          of Ly = b
for k = 2 : m
    b(k) = b(k) - L(k,1:k-1) * b(1:k-1); % DOT
end
