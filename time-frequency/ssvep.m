% only once
addpath('/home/karolaug/Work/svarog2matlab/');
addpath('/home/karolaug/Work/tf/');
% only once

freq = sv_loadfreq('jaroslaw-rybusinski-ssvep-1');
unique(freq)
freq_from = 3;
freq_to = 75;
channel_analyze = 6;
freq_analyze = 7;
fs = 1024;
NFFT = floor(fs);
ref1 = 9;
ref2 = 10;
%NFFT = NFFT/8;


%only once
data1 = sv_ssvep_matrix('jaroslaw-rybusinski-ssvep-1', 30, [-1,6]);
data2 = sv_ssvep_matrix('jaroslaw-rybusinski-ssvep-2', 30, [-1,6]);
data3 = [data1, data2];
clear data1;
clear data2;
data4 = mean(data3,2);
clear data3;
%

sig = squeeze(data4(freq_analyze,1,channel_analyze,:) - (data4(freq_analyze,1,ref1,:) + data4(freq_analyze,1,ref2,:))/2)';
sig = detrend(sig);
%[P, f, t] = tf_cwt(sig,freq_from,freq_to,fs);

sig = decimate(sig, 8);
fs = fs/8;



% [P, f, t] = tf_wvd(sig,fs);


T = max(size(sig))/fs
NFFT = NFFT/8;
sig_padded = [zeros(1,floor(NFFT/2)), sig, zeros(1,floor(NFFT/2))];
P=spectrogram(sig_padded,NFFT,NFFT-1,NFFT,fs);
pcolor(linspace(0,T,size(P,2)),linspace(0,(fs/2),size(P,1)),abs(P)); shading interp;


title({'SSVEP, 25Hz, SPECTROGRAM'});

%mesh(1+freq_from:min(size(P)+freq_from),1:max(size(P)),P');


