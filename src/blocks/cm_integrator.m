function block = cm_integrator(name, gain)
% cm_integrator - return a struct describing a current-mode integrator
if nargin < 2, gain = 1; end
block.type = 'integrator';
block.name = name;
block.gain = gain;
end
