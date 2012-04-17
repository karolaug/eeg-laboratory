%malpa
addpath('/home/karolaug/Work/MP/');
addpath('/home/karolaug/Work/MP/viewData/');
addpath('/home/karolaug/Work/tf/');
%import malpa
clear all
%signal = importdata('Characterize_ch4_F50_G4.mat');
load 'data/Characterize_ch4_F50_G4.mat'
signal = X;
clear X;
%signal = reshape(signal,max(size(signal)), 50, 1);
size(signal)

fs = 5000/10;
NFFT = floor(fs);



for i=1:50,
    signal2(i,:) = decimate(signal(i,:), 10);
end
signal = signal2(:,251:1274);
%signal = mean(signal, 1);
sig = squeeze(signal);
clear signal
T = max(size(sig))/fs;



% %CWT, WVD
for i=1:50,
    %[P, f, t] = tf_cwt(sig(i,:),5,250,fs);
    [P, f, t] = tf_wvd(sig(i,:),fs);
    Pm(i,:,:) = P;
    fm(i,:) = f;
    tm(i,:,:) = t;
end
P = squeeze(mean(Pm,1));
Pmean = mean(P(:,128:256),2);
P = bsxfun(@minus, P, Pmean);
pcolor(linspace(0,T,size(P,2)),linspace(5,250,size(P,1)),real(P)); shading interp;
title({'monkey, WVD'});

% 
% for i=1:50,
%     sig_padded = [zeros(1,floor(NFFT/2)), sig(i,:), zeros(1,floor(NFFT/2))];
%     P(i,:,:)=spectrogram(sig_padded,NFFT,NFFT-1,NFFT,fs);
% end
% P = squeeze(mean(P,1));
% Pmean = mean(P(:,1:256),2);
% P = bsxfun(@minus, P, Pmean);
% pcolor(linspace(0,T,size(P,2)),linspace(0,(fs/2),size(P,1)),abs(P)); shading interp;
% title({'monkey, SPECTROGRAM'});

