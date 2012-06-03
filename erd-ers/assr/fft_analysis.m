clear all
h = '/home/karolaug/Work/';
load([h 'eeg-laboratory/erd-ers/assr/data_final_plain.mat']);
load([h 'eeg-laboratory/erd-ers/assr/others.mat']);


data_plain_fft = fft(data_plain,[],3);
fft_plain = abs(squeeze(mean(data_plain_fft,1)));
t = linspace(0,info.fs,length(fft_plain));
draw_assr(fft_plain, t, [20,80], []);