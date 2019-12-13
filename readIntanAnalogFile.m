function v = readIntanAnalogFile(fname,board_adc_channels)
%
% function to read in a digital IO Intan file ('digitalIn' or 'digitalOut')
%
% INPUTS
%   fname - filename of the Intan digital file to read
%
% OUTPUTS
%   v - m x n matrix where each row is a vector of voltages recorded on
%       a single channel

num_channels = length(board_adc_channels); % ADC input info from header file
fileinfo = dir(fname);
num_samples = fileinfo.bytes/(num_channels * 2); % uint16 = 2 bytes
fid = fopen(fname, 'r');

v = fread(fid, [num_channels, num_samples], 'uint16');
fclose(fid);
v = v * 0.000050354; % convert to volts

