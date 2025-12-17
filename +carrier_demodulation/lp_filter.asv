% Group : Sude Topgül & Antonia Juncu

function r = lp_filter(r_tilde_IQ, lp_impulse_response)
% LP_FILTER: lowpass filtering of r_tilde_IQ to filter the high
% frequencies created during the carrier modulation
% This function uses convolution to perform lowpass filtering to recover
% the baseband signal.

% r = zeros(1,length(lp_impulse_response)+length(r_tilde_IQ)-1);
    
r = conv(r_tilde_IQ, lp_impulse_response);
r = r(:).';

end

