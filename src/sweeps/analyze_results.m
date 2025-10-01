function analyze_results(csvfile)
if nargin<1, csvfile = fullfile('data','sample_results.csv'); end
T = readtable(csvfile);
disp(T);
% Basic plotting
figure; plot(T.OSR, T.SNR_dB, 'o-'); xlabel('OSR'); ylabel('SNR (dB)'); grid on;
end
