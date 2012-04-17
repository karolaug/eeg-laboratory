addpath('/home/karolaug/Work/eeglab/');
addpath('/home/karolaug/Work/svarog2matlab/');

%sv_loadeeg_ssvep('jaroslaw-rybusinski-ssvep-1', 30);

[info, data] = sv_loaddata('jaroslaw-rybusinski-ssvep-1');
data = sv_sig2trigg_ssvep_kus(info, data, 30, 'jaroslaw-rybusinski-ssvep-1');
data(11:29,:) = [];
data(12:13,:) = [];
size(data)
info.numchans = 12;
info.channames(11:29) = [];
info.channames(12:13) = [];
info.gain(11:29) = [];
info.offset(11:29) = [];
info.gain(12:13) = [];
info.offset(12:13) = [];
sv_loadeeg(info, data);


