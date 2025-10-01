% run_all.m
% Sweeps OSR and quantizer bits and saves results to CSV
setup;
osr_list = [32, 64, 128];
bits_list = [1,2,3];
results = [];
for osr = osr_list
for b = bits_list
fprintf('Running OSR=%d, bits=%d\n', osr, b);
modelName = sprintf('ds_mod_osr%d_b%d', osr, b);
order = 3; % default to 3rd order for sweep
fs = 2*4e6*osr; % sample rate = 2*band*OSR (Nyquist safety)
build_modulator_model(modelName, order, b, osr, fs);
load_system(modelName);
simOut = sim(modelName, 'StopTime','0.002');
% retrieve output signal from workspace (assumes block writes to 'y')
if evalin('base', 'exist(''y'',''var'')')
y = evalin('base', 'y');
else
warning('Output ''y'' not found after sim. Skipping metrics.');
continue
end
[snr_db, enob] = compute_snr_enob(y, 4e6, fs);
results = [results; osr, b, order, snr_db, enob];
close_system(modelName, 0);
end
end
save_results_csv(results, fullfile('data','sample_results.csv'));
fprintf('Sweep complete. Results saved to data/sample_results.csv\n');
