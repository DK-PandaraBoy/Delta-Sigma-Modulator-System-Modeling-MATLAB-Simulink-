function save_results_csv(mat, outpath)
% mat columns: OSR, bits, order, SNR_dB, ENOB
T = array2table(mat, 'VariableNames', {'OSR','Bits','Order','SNR_dB','ENOB'});
if ~exist(fileparts(outpath),'dir')
mkdir(fileparts(outpath));
end
writetable(T, outpath);
end
