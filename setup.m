% setup.m
% Adds project folders to MATLAB path
root = fileparts(mfilename('fullpath'));
addpath(genpath(root));
fprintf('Project paths added to MATLAB path. Root: %s\n', root);
