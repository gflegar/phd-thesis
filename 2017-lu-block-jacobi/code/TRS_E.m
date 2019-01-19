% Input  : m x m matrix L, rhs vector b
% Output : Vector b overwritten by the solution y 
%          of Ly = b
for k = 1 : m-1
    b(k+1:m) = b(k+1:m) - L(k+1:m,k) * b(k); % AXPY
end
