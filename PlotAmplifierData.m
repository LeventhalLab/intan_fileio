%% Plotting Amplifier Data
% function data = readIntanAmplifierData_JM(filename,varargin)
data = readIntanAmplifierData_JM('amplifier.dat','start',100,'duration',20,'nChannels',64,'channels',[1,2,3]);
% reads in 'amplifier' data starting at 100s, ending at 120 second, but
% only channels 1,2, and 3 of a 64 channel NeuroNexus Probe.
% 100 - 120 seconds is roughly equivalent to 400,000 points of data (20
% seconds of data at a 20,000Hz/S sampling rate). This is roughly
% surrounding trial # 2 of R0326 tested on 20200228
plot(data([1:end],1)); % plots all data in column 1