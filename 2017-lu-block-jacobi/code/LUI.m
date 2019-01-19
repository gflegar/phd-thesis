% Input  : m x m nonsingular matrix block Di
% Output : Di overwritten by its L, U factors
p = zeros(1, m);
for k = 1 : m
  % Implicit pivoting
  abs_vals         = abs(Di(:,k));
  abs_vals(p>0)    = -1; % exclude pivoted rows
  [abs_ipiv, ipiv] = max(abs_vals);
  p(ipiv)          = k;
   
  % Gauss transformation
  d              = Di(ipiv,k);           % Pivot
  Di(p==0,k)     = Di(p==0,k) / d;       % SCAL
  Di(p==0,k+1:m) = Di(p==0,k+1:m) ...
                 - Di(p==0,k) * Di(ipiv,k+1:m); % GER
end
% Combined row swaps
p(p) = 1:m;      % Invert the permutation
Di   = Di(p,:);
