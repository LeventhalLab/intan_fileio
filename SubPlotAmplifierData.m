%% Plotting Amplifier Data

intan_data = read_Intan_RHD2000_file_DL('info.rhd'); %Read in 'Intan RHD file'...
%contains info like frequency, number of channels, etc.

amplifier_Fs = intan_data.frequency_parameters.amplifier_sample_rate;

% num_amplifier_channels = intan_data.amplifier_channels; %% isn't strictly numerical

data = readIntanAmplifierData_JM('amplifier.dat','start',0,'duration',300,...
       'nChannels',64,...
       'frequency',amplifier_Fs);
% reads in 'amplifier' data starting at 100s, ending at 120 second, but
% only channels 1,2, and 3 of a 64 channel NeuroNexus Probe.
% 100 - 120 seconds is roughly equivalent to 400,000 points of data (20
% seconds of data at a 20,000Hz/S sampling rate). This is roughly
% surrounding trial # 2 of R0326 tested on 20200228
% plot(data([1:end],1)); % plots all data in column 1
%%
start_sample = 1298000;
end_sample = 1315000;

y_ax_lims = [-400 400];

num_rows = 5;
num_cols = 1;
t = linspace(start_sample, end_sample, end_sample-start_sample+1) / amplifier_Fs;

channel_list = [5, 13, 27, 54, 60];
nnSite = [53, 61, 45, 5, 11];

h_fig = figure(1);

for i_row = 1 : num_rows
    for i_col = 1 : num_cols
        ii = (i_row-1) * num_cols + i_col;
        
        subplot(num_rows,num_cols,ii);
        plot(t, data(start_sample:end_sample,channel_list(ii)))
        set(gca, 'ylim', y_ax_lims)
        
        title(sprintf('channel %d', channel_list(ii)))
        
        if i_col == 1
            ylabel('microvolts')
        end
        if i_row == num_rows
            xlabel('time (s)')
        end
        
    end
end
% 
% subplot(2,3,2);
% plot(data([1299000:1302300],5))
% title('channel 5')
% ylabel('microvolts')
% 
% subplot(2,3,3);
% plot(data([1299000:1302300],13))
% title('channel 13')
% ylabel('microvolts')
% 
% subplot(2,3,4);
% plot(data([1299000:1302300],14))
% title('channel 14')
% ylabel('microvolts')
% 
% subplot(2,3,5);
% plot(data([1299000:1302300],20))
% title('channel 20')
% ylabel('microvolts')
% 
% subplot(2,3,6);
% plot(data([1299000:1302300],60))
% title('channel 60')
% ylabel('microvolts')
