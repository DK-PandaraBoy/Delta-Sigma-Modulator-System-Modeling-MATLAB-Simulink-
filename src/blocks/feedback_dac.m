
function dac = feedback_dac(levels)
if nargin < 1, levels = 2; end
dac.levels = levels;
% simple unit-amplitude scaled DAC weights
dac.weights = (-levels/2 : levels/2-1);
end
