clear all
h = '/home/karolaug/Work/';
load([h 'eeg-laboratory/erd-ers/assr/data_final_plain.mat']);
load([h 'eeg-laboratory/erd-ers/assr/others.mat']);


data_plain_fft = fft(data_plain,[],3);
fft_plain = abs(squeeze(mean(data_plain_fft,1)));
t = linspace(0,info.fs,length(fft_plain));
for i=1:27
    fft_plain(i,:) = conv(fft_plain(i,:),ones(20,1), 'same');
end
draw_assr(fft_plain, t, [35,45], [0,0]);
