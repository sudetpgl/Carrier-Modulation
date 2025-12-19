% Group : Sude Topgül & Antonia Juncu
function [discrete_pulse, sigma2_rx] = get_discrete_channel_model( ...
    n_os, tx_pulse, rx_pulse, channel_pulse, filterspan_pulse, sigma2_ch)

tx_p = tx_pulse(:).';
ch_p = channel_pulse(:).';
rx_p = rx_pulse(:).';

% convolve pulses 
h_os = conv(conv(tx_p, ch_p), rx_p);

%sample at symbol rate by taking every n_os sample
h_sampled = h_os(1:n_os:end);   

if mod(length(h_sampled),2) == 0
    h_sampled = [h_sampled, 0];
end


discrete_pulse = h_sampled(:).';

% computing variance of filtered noise at receiver sampling points by adding noise 
sigma2_rx = sigma2_ch * sum(rx_p(:).^2);

end
