% Group : Sude Topgül & Antonia Juncu

function [r_tilde_IQ] = demodulate(seq_in,f,phase,n_os,is_complex)
% DEMODULATE: performs carrier demodulation to the bandpass singals after
% carrier modulation to recover the baseband (without the lowpass filtering)

% First of all the signal is grouped according to the is_complex input. 

% If is_complex is true the real bandpass signal will be demodulated using
% in-phase (I) and quadrature (Q) branches. To get the in-phase component
% of the demodulated signal the modulated signal will be multiplied with
% sqrt(2)*cos(2*pi*f*t + phase). To get the quadrature component the signal
% will be multiplied with -sqrt(2)*sin(2*pi*f*t + phase). The resulting I
% and Q components are combined to form the complex baseband signal
% r_tilde_IQ = R_I + 1j*R_Q, which is required for 2D modulation schemes
% such as QPSK and QAM.

% If is_complex is false the singal will be multiplied only with in-phase
% (cosine) to get the in-phase component. The result signal will be  r_tilde_IQ = R_I

% It is important that this function only performs carrier demodulation. In
% order to fully recover the baseband signal before the carrier modulation,
% r_tilde_IQ should be filtered with a lowpass to remove highfrequency
% components, which will be coded in the third question. 


r_tilde_IQ = zeros(size(seq_in));

n = 0:length(seq_in)-1;
t = n/n_os;


if is_complex == true

    R_I = seq_in .* (sqrt(2)*cos(2*pi*f*t + phase)); 
    R_Q = seq_in .* (-sqrt(2)*sin(2*pi*f*t + phase));
    r_tilde_IQ = R_I + 1j*R_Q
  
else 
     R_I = seq_in .* (sqrt(2)*cos(2*pi*f*t + phase)); 
     r_tilde_IQ = R_I
end 

end 