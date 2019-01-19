% Input  : m x m nonsingular matrix block Di.
% Output : Matrix block Di overwritten by its inverse
p = [1:m];
for k = 1 : m
    % explicit pivoting
    [abs_ipiv, ipiv]      = max(abs(Di(k:m,k)));
    ipiv                  = ipiv+k-1;
    [Di(k,:), Di(ipiv,:)] = swap(Di(ipiv,:), Di(k,:));
    [p(k),   p(ipiv)]     = swap(p(ipiv), p(k));

    % Jordan transformation
    d       =  Di(k,k);
    Di(:,k) =-[Di(1:k-1,k); 0; Di(k+1:m,k)] / d;% SCAL
    Di      =  Di + Di(:,k) * Di(k,:);          % GER
    Di(k,:) = [Di(k,1:k-1), 1, Di(k,k+1:m)] / d;% SCAL
end
% Undo permutations
Di(:,p) = Di;
