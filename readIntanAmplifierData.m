function [amplifier_data] = readIntanAmplifierData(filename,t_start,t_end)
%
%
% UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% INPUTS
%   filename - 'amplifier.dat' %% File to read
%   t_start - position to start reading (in s) %% Multiply by Fs???
%   t_end - postiion to end reading (in s) %% Multiply by Fs???
%   Fs - (Frequency) sample_rate(in Hz, default = 20kHz)
%   amplifier_channels - number of data channels in the file
%   
%   Other Inputs that might be helpful later (4/1/2020 JM)
%   'precision' - sample precision (default = 'int16')
%   'channels'  - channels to read, base 1 (default = all) %% Use a line of
%           code to only read from specified channels. There should be 64 channels
%           in the 'amplifier.dat' file. 4/1/2020 JM
%   Check this file against Watson Lab bz_LoadBinary function. It appears
%   to contain everything we would want this file to define and run.

amplifier_channels = 64;
frequency = 20000;

fid = fopen(filename, 'r');

% figure out the starting point in the file
bytes_to_skip = ceil(t_start * frequency * amplifier_channels * 2);   % time * sampling rate * number of channels * 2 bytes/sample
samples_to_read = floor((t_end - t_start) * frequency);
fseek(fid, bytes_to_skip, 'cof');

amplifier_data = fread(fid, [amplifier_channels, samples_to_read], 'int16');
fclose(fid);
amplifier_data = amplifier_data * 0.195; % convert to microvolts

end

