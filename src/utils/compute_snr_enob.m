function [snr_db, enob] = compute_snr_enob(y, f_signal, fs)
% compute_snr_enob - compute SNR and ENOB of signal y containing tone at f_signal
% simple FFT-based estimator; expects y as vector and fs sample rate
if isstruct(y) && isfield(y,'signals')
% support Simulink timeseries
y = y.signals.values;
end
x = y(:);
N = length(x);
Y = fft(x .* hann(N));
P2 = abs(Y/N).^2;
P1 = P2(1:floor(N/2));
freq = (0:floor(N/2)-1) * (fs/N);
% find peak near f_signal
[~, idx] = min(abs(freq - f_signal));
sig_bin = idx;
% signal power
signal_power = P1(sig_bin);
% total power in band excluding DC and signal bin +/-1
noise_bins = true(size(P1));
noise_bins(max(1,sig_bin-1):min(length(P1),sig_bin+1)) = false;
noise_bins(1) = false; % exclude DC
noise_power = sum(P1(noise_bins));
snr = signal_power / noise_power;
snr_db = 10*log10(snr);
enob = (snr_db - 1.76) / 6.02;
end
