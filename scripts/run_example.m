% run_example.m
% Builds a 2nd-order, 1-bit ΔΣ modulator and simulates.
setup;
modelName = 'ds_mod_example';
order = 2;
OSR = 64;
bits = 1;
fs = 4e6 * 2*OSR; % sampling frequency derived from signal band 4 MHz and OSR
build_modulator_model(modelName, order, bits, OSR, fs);


% load and simulate
load_system(modelName);
sim(modelName, 'StopTime','0.001'); % short sim for example
try
save_system(modelName, [modelName '.slx']);
fprintf('Saved model: %s.slx\n', modelName);
catch
warning('Could not save .slx (maybe running on GNU Octave or permissions).');
