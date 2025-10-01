function q = quantizer_block(bits)
% quantizer_block - simple uniform mid-rise quantizer struct
q.bits = bits;
q.levels = 2^bits;
q.delta = 1/q.levels;
end
