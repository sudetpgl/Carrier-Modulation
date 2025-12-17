% Group : Sude Topgül & Antonia Juncu

function [impulse_response] = bandpass(f_c, filterspan, B, n_os)
% BANDPASS: generates the impulse response of an ideal bandpass filter.

% The function designs an ideal bandpass filter with frequency response:
% H_BP(f) = 1 for f_c - B/2 <= abs(f) <= f_c + B/2
% H_BP(f) =  0 otherwise
% in normalized frequency units n_os
%
% Number of samples is defined with samples_num, which is the
% multiplication of filterspan and n_os plus 1. The additinal sample is for the 0 Hz (DC) at the center.
% 
% The frequency axis is defined over the interval [-samples_num/2, (samples_num/2)-1] with a frequency
% resolution of n_os/samples_num corresponding to the FFT frequency bins.
% (Frequency resolution is the frequency spacing between to adjacent
% freqeuncy bins, while each frequency bin represents a single discrete frequency point or a small interval that can be resolved by the FFT)
% Due to the convention of ifft in MATLAB, it shifts the created bandpass with ifftshift so that its DC (0 Hz) on the
% frequency axis is on the first index.
%
% With H_BP the ideal bandpass filter is designed in the frequency domain.
% To apply inverse fourier transform we must first shift the DC to index
% 1,due to MATLAB's ifft convention.
% After the IFFT, the impulse response should be shifted back to the center (time 0) with
% fftshift, because the given filter in the question is symmetric, meaning it has linear-phase. 
% Therefore, we get the impulse response of an linear-phase ideal FIR bandpass filter.

assert(mod(filterspan,2)==0,'filterspan must be an even number');

%impulse_response = zeros(1,filterspan * n_os);

samples_num = filterspan * n_os + 1; %number of samples

f = (-samples_num/2 : (samples_num/2)-1) * n_os/samples_num; %n_os/samples_num -> FFT frquency resoultion

H_BP = double(abs(f - f_c) <= B/2 | abs(f + f_c) <= B/2); 

h_BP = ifft(ifftshift(H_BP), 'symmetric');

impulse_response = fftshift(h_BP);

end


