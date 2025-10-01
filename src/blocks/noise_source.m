function n = noise_source(rms)
if nargin < 1, rms = 1e-9; end
n.type = 'gaussian';
n.rms = rms;
end
