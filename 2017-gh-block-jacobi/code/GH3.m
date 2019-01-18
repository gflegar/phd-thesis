% Input  : m x m nonsingular matrix block Di, right-hand side bi
% Output : Di overwritten by the GH factorization, solution xi
p  = [1:m];
for k = 1 : m
   % Row elimination. Matrix-vector product (GEMV)
   Di(k,k:m)             = Di(k,k:m) - Di(k,1:k-1) * Di(1:k-1,k:m);
   bi(k)                 = bi(k)     - Di(k,1:k-1) * bi(1:k-1);
   % Column pivoting (explicit)
   [abs_ipiv, ipiv]      = max(abs(Di(k,k:m)));
   ipiv                  = ipiv+k-1;
   [Di(:,ipiv), Di(:,k)] = swap(Di(:,ipiv), Di(:,k));
   [p(ipiv),    p(k)]    = swap(p(ipiv),    p(k));
   % Diagonalization. Vector scaling (SCAL)
   Di(k,k+1:m)           =  Di(k,k+1:m) / Di(k,k);
   bi(k)                 =  bi(k)       / Di(k,k);
   % Column elimination. Outer product (GER)
   Di(1:k-1,k+1:m)       = Di(1:k-1,k+1:m) - Di(1:k-1,k) * Di(k,k+1:m);
   bi(1:k-1)             = bi(1:k-1)       - Di(1:k-1,k) * bi(k);
end
xi(p) = bi;

