function [Ei, success] = truncate_format(Ei, Di_cond_num1,...
                                         tau_r_L, tau_r_U, tau_k)
%
% Inputs : mi x mi dense inverse block Ei;
%          condition number of Di (and Ei) in Di_cond_num1; and
%          thresholds to determine use of reduced format:
%            - tau_r_L and tau_r_U (with tau_r=tau_h or tau_s), and
%            - tau_k 
% Output : mi x mi dense inverse block Ei 
%          overwritten with the reduced format if applicable
%
success = 0;                             % FALSE
if (tau_r_L < Di_cond_num1) & (Di_cond_num1 <= tau_r_U)
  Ei_reduced      = force_reduction(Ei); % Truncate to reduced format
  Ei_reduced_nrm1 = norm(Ei_reduced,1);
  if (Ei_reduced_nrm1 > 0.0)             % Ei contains nonzero entries
    % Compute the condition number of truncated block via explicit 
    % inverse: easier to implement on GPU than SVD
    Ei_reduced_cond_num1 = Ei_reduced_nrm1 * norm(inv(Ei_reduced),1); 
    if (Ei_reduced_cond_num1 < tau_k)    % Ei is not (close to) singular
      Ei                 = Ei_reduced;
      success = 1;                       %TRUE 
    end
  end
end
%
return;
