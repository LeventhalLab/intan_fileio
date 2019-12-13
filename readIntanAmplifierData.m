function [amplifier_data] = readIntanAmplifierData(filename,t_start,t_end,Fs,amplifier_channels)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% INPUTS
%   filename - 
%   t_start - 
%   t_end - 
%   Fs - sampling rate, in Hz

num_channels = length(amplifier_channels); % amplifier channel info from header file

fileinfo = dir(filename);

num_samples = fileinfo.bytes/(num_channels * 2); % int16 = 2 bytes
fid = fopen(filename, 'r');

% figure out the starting point in the file
bytes_to_skip = ceil(t_start * Fs * num_channels * 2);   % time * sampling rate * number of channels * 2 bytes/sample
samples_to_read = floor((t_end - t_start) * Fs);
fseek(fid, bytes_to_skip, 0);

amplifier_data = fread(fid, [num_channels, samples_to_read], 'int16');
fclose(fid);
amplifier_data = amplifier_data * 0.195; % convert to microvolts

end

