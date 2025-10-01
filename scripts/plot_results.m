% plot_results.m
% Load sweep results and generate publication-quality plots
setup;
resultsFile = fullfile('data','sample_results.csv');
T = readtable(resultsFile);


% Plot SNR vs OSR
figure; hold on;
g = findgroups(T.Bits);
colors = lines(max(g));
for b = unique(T.Bits)'
idx = T.Bits == b;
plot(T.OSR(idx), T.SNR_dB(idx), '-o', 'DisplayName', sprintf('%d-bit', b));
end
xlabel('Oversampling Ratio (OSR)'); ylabel('SNR (dB)');
grid on; legend show;
title('SNR vs OSR for different quantizer resolutions');


% Plot ENOB vs OSR
figure; hold on;
for b = unique(T.Bits)'
idx = T.Bits == b;
plot(T.OSR(idx), T.ENOB(idx), '-s', 'DisplayName', sprintf('%d-bit', b));
end
xlabel('Oversampling Ratio (OSR)'); ylabel('ENOB (bits)');
grid on; legend show;
title('ENOB vs OSR for different quantizer resolutions');
