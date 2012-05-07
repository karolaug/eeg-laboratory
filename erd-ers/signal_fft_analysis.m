clear all
h = '/home/karolaug/Work/';
load([h 'eeg-laboratory/erd-ers/data.mat']);

data_exp_fft = fft(data_exp,[],3);
data_ref_fft = fft(data_ref,[],3);

fft_exp = real(squeeze(mean(data_exp_fft,1)));
fft_ref = real(squeeze(mean(data_ref_fft,1)));


%plot(t, fft_exp(9,:));
plot(t, fft_ref(9,:));
