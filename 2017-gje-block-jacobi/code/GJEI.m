% Input  : m x m nonsingular matrix block Di.
% Output : Matrix block Di overwritten by its inverse
p = zeros(1, m);
for k = 1 : m
    % implicit spivoting
    abs_elems        = abs(Di(:, k));
    abs_elems(p > 0) = -1; % exclude already pivoted rows
    [abs_ipiv, ipiv] = max(abs_elems);
    p(ipiv)          = k;
   
    % Jordan transformation
    d          =  Di(ipiv, k);
    Di(:,k)    =-[Di(1:ipiv-1,k); 0; Di(ipiv+1:m,k)] / d;% SCAL
    Di         =  Di + Di(:,k) * Di(ipiv,:);             % GER
    Di(ipiv,:) = [Di(ipiv,1:k-1), 1, Di(ipiv,k+1:m)] / d;% SCAL
end
% Undo permutations
Di(p,:) = Di(:,p);
