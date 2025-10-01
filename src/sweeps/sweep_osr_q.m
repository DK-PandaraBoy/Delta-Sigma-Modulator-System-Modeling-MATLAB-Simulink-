function results = sweep_osr_q(osr_list, bits_list)
% sweep_osr_q - convenience wrapper for sweeping OSR and quantizer bits
if nargin<2, error('osr_list and bits_list required'); end
results = [];
for osr = osr_list
for b = bits_list
modelName = sprintf('tmp_osr%d_b%d', osr, b);
build_modulator_model(modelName, 3, b, osr, 2*4e6*osr);
load_system(modelName);
sim(modelName, 'StopTime','0.002');
if evalin('base','exist(''y'',''var'')')
y = evalin('base','y');
[snr_db, enob] = compute_snr_enob(y, 4e6, 2*4e6*osr);
results = [results; osr, b, snr_db, enob];
end
close_system(modelName,0);
end
end
end
