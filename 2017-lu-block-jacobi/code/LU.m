% Input  : m x m nonsingular matrix block Di
% Output : Di overwritten by its L, U factors
p = [1:m];
for k = 1 : m
  % Pivoting
  [abs_ipiv, ipiv]      = max(abs(Di(k:m,k)));
  ipiv                  = ipiv+k-1;
  [Di(k,:), Di(ipiv,:)] = swap(Di(ipiv,:), Di(k,:));
  [p(k),   p(ipiv)]     = swap(p(ipiv), p(k));

  % Gauss transformation
  d               = Di(k,k);             % Pivot
  Di(k+1:m,k)     = Di(k+1:m,k) / d;     % SCAL
  Di(k+1:m,k+1:m) = Di(k+1:m,k+1:m) ...
                  - Di(k+1:m,k) * Di(k,k+1:m); % GER
end
