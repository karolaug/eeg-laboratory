clear all
h = '/home/karolaug/Work/';
load([h 'eeg-laboratory/erd-ers/data_non_filter.mat']);
load([h 'eeg-laboratory/erd-ers/others.mat']);

data_exp_fft = fft(data_exp,[],3);
data_ref_fft = fft(data_ref,[],3);

fft_exp = abs(squeeze(mean(data_exp_fft,1)));
fft_ref = abs(squeeze(mean(data_ref_fft,1)));
t_conv = linspace(0, 256, 522);
t = t_conv;
%size(t_conv)
%size(conv(fft_ref(11,:),ones(10,1)))

c1_exp = conv(fft_exp(9,:),ones(10,1))
c2_exp = conv(fft_exp(11,:),ones(10,1))

c1_ref = conv(fft_ref(9,:),ones(10,1))
c2_ref = conv(fft_ref(11,:),ones(10,1))

subplot(2,2,1)
plot(t, c1_exp, 'r', t, c1_ref, 'b')
axis([0,40,0,4000])
title('elektroda C3');
subplot(2,2,2)
plot(t, c2_exp, 'r', t, c2_ref, 'b')
axis([0,40,0,4000])
title('elektroda C4');

subplot(2,2,3)
plot(t, c1_exp - c1_ref, 'b')
axis([0,40,-500,500])
title('roznica C3');
subplot(2,2,4)
plot(t, c2_exp - c2_ref, 'b')
axis([0,40,-500,500])
title('roznica C4');
