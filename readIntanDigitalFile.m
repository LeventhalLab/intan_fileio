function digital_word = readIntanDigitalFile(fname)
%
% function to read in a digital IO Intan file ('digitalIn' or 'digitalOut')
%
% INPUTS
%   fname - filename of the Intan digital file to read
%
% OUTPUTS
%   digital_word - vector of uint16's containing bit-wise values of each
%      digital line from the Intan system

fileinfo = dir(fname);
num_samples = fileinfo.bytes/2; % uint16 = 2 bytes
fid = fopen(fname, 'r');
digital_word = fread(fid, num_samples, 'uint16');
fclose(fid);

% Individual digital inputs can be isolated using the bitand function in MATLAB:
% digital_input_ch = (bitand(digital_word, 2^ch) > 0); % ch has a value of 0-15 here