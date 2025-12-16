% Group : Sude Topgül & Antonia Juncu

function [s_tilde] = modulate(s,f_0,n_os)
% MODULATE: modulates the a basebandsignal to a bandpass signal

% This function modulates an oversampled complex (2D modulation formats such as  QAM and PSK) or
% real(1D modulation formats such as ASK and OOK) baseband singal of a carrier of
% normalized frequency f_0. 

% the carrier is given by:
%  exp(1j * 2* pi * f_0 * t ) with t = n/n_os. 
% Here n is the sampling index and n_os is the oversampling factor.

% Multiplication of the baseband signal with the carrier in the time domain
% corresponds to a frequency shift of f_0 in the frequency domain. Thus, the baseband centered at 0 Hz is
% shifted to the bandpass signal centered at f_0 Hz.
% 
% Since in practice only real-valued signal can be transmitted, the real
% part of the modulated signal is subtracted to get the signal s_tilde.
 
s_tilde = zeros(size(s));
n = 0 : length(s)-1; % sampling index
t = n/n_os;
s_shifted = s .* exp(1j * 2* pi * f_0 * t ); % S.e^(j.2.pi.f_0.t) => S(f-f_0)
s_tilde = real(s_shifted); % imaginary signals can't be transmitted

end