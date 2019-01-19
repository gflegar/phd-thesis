% PCG method
% Compute preconditioner A -> M
% Initialize x, p, r = b - A * x, tau = r' * r, gamma_old 
while(tau > tau_max)
    z          = M \ r;                 % = M^{-1} r, apply preconditioner

    gamma_new  = r' * z;                % DOT product

    beta       = gamma_new / gamma_old; % scalar operation
    p          = z + beta * p;          % AXPY-type
    q          = A * p;                 % SpMV
    eta        = p' * q;                % DOT product
    alpha      = gamma_new / eta;       % scalar operation
    gamma_old  = gamma_new;             % scalar operation
    x          = x + alpha * p;         % AXPY
    r          = r - alpha * q;         % AXPY
    tau        = r' * r;                % = ||r||_2,  DOT product 
end


