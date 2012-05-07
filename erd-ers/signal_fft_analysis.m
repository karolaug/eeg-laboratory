clear all
h = '/home/karolaug/Work/';
load([h 'eeg-laboratory/erd-ers/data.mat']);

data_exp_fft = fft(data_exp,[],3);
data_ref_fft = fft(data_ref,[],3);

fft_exp = real(squeeze(mean(data_exp_fft,1)));
fft_ref = real(squeeze(mean(data_ref_fft,1)));


subplot(2,2,1)
plot(t,fft_exp(9,:),'r',t,fft_ref(9,:),'b')
axis([5,15,0,1500])
title('elektroda C3');
subplot(2,2,2)
plot(t,fft_exp(11,:),'r',t,fft_ref(11,:),'b')
axis([5,15,0,1500])
title('elektroda C4');

subplot(2,2,3)
plot(t,fft_exp(9,:) - fft_ref(9,:),'b')
axis([5,15,0,200])
title('roznica C3');
subplot(2,2,4)
plot(t,fft_exp(11,:) - fft_ref(11,:),'b')
axis([5,15,0,200])
title('roznica C4');
