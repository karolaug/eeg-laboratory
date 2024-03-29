% only once
addpath('/home/karolaug/Work/svarog2matlab/');
addpath('/home/karolaug/Work/tf/');
addpath('/home/karolaug/Work/MP/');
addpath('/home/karolaug/Work/MP/viewData/');
% only once

freq = importdata('jaroslaw-rybusinski-ssvep-1.txt');
unique(freq)
freq_from = 15;
freq_to = 40;
channel_analyze = 6;
freq_analyze = 6;
krok = 7;
fs = 1024/krok;
ref1 = 9;
ref2 = 10;

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
%[P, f, t] = tf_cwt(sig,freq_from,freq_to,fs);
%mesh(1+freq_from:min(size(P)+freq_from),1:max(size(P)),P');

sig = decimate(sig, krok);
sig = reshape(sig,[max(size(sig)),1,1]);
sig = sig(1:1024,:)
size(sig)
importData(sig, '../../mp_test/', 'test1');
runGabor('../../mp_test/', 'test1');
data = getGaborData('../../mp_test','test1',1);
size(data)
[sumEnergy] = reconstructEnergyFromAtomsMPP(data{1}.gaborData,max(size(sig)),1,[]);
f = 0:fs/max(size(sig)):fs/2;
t = (0:max(size(sig))-1)/fs;
pcolor(t,f,sumEnergy); shading interp;
xlabel('Time (s)'); ylabel('Frequency (Hz)');





