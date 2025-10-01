function build_modulator_model(modelName, order, bits, OSR, fs)
% build_modulator_model - programmatically creates a Simulink model for a
% current-mode delta-sigma modulator of specified order and quantizer bits.
% NOTE: this script uses Simulink API; requires MATLAB with Simulink.
if nargin<5, error('Usage: build_modulator_model(modelName, order, bits, OSR, fs)'); end


% close if exists
if bdIsLoaded(modelName)
close_system(modelName, 0);
end
new_system(modelName);
open_system(modelName);


% add blocks: input (sine), integrators, quantizer (Matlab Function), feedback
inBlk = add_block('simulink/Sources/Sine Wave', [modelName '/u'], 'Position', [30 30 90 60]);
set_param([modelName '/u'], 'Amplitude', '0.5', 'Frequency', sprintf('%g', 2*pi*1e5));


prev = 'u';
x = 120;
for k=1:order
pos = [x 30+ (k-1)*80 x+60 80+(k-1)*80];
blkName = sprintf('int%d', k);
add_block('simulink/Continuous/Integrator', [modelName '/' blkName], 'Position', pos);
add_line(modelName, sprintf('%s/1', prev), sprintf('%s/1', blkName));
prev = blkName;
x = x + 120;
end


% Quantizer block - use MATLAB Function block to quantize
qpos = [x 30 x+120 90];
qblk = add_block('simulink/User-Defined Functions/MATLAB Function', [modelName '/Quantizer'], 'Position', qpos);
matlabFunctionCode = sprintf(['function y = fcn(u)\n', ...
'levels = %d;\n', ...
'delta = 1/levels;\n', ...
'y = delta*floor(u/delta + 0.5);\n', ...
'end'], 2^bits);
set_param(qblk, 'Script', matlabFunctionCode);
add_line(modelName, sprintf('%s/1', prev), 'Quantizer/1');


% Output sink
outPos = [x+160 30 x+220 90];
add_block('simulink/Sinks/To Workspace', [modelName '/y'], 'VariableName', 'y', 'Position', outPos);
add_line(modelName, 'Quantizer/1', 'y/1');


% Simple feedback path from Quantizer to first integrator using Gain block
fbPos = [x+60 150 x+120 200];
add_block('simulink/Math Operations/Gain', [modelName '/FB'], 'Gain', '1', 'Position', fbPos);
add_line(modelName, 'Quantizer/1', 'FB/1');
add_line(modelName, 'FB/1', 'int1/1');


% set solver and sample time settings conservatively
set_param(modelName, 'Solver', 'ode45', 'StopTime', '0.001');


fprintf('Built model %s (order=%d, bits=%d, OSR=%d, fs=%g)\n', modelName, order, bits, OSR, fs);
end
