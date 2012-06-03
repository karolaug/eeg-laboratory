addpath('/home/karolaug/Work/svarog2matlab/');
addpath('/home/karolaug/Work/eeg-laboratory/erd-ers/movement/');
clear all
h = '/home/karolaug/Work/';
[info, data] = sv_loaddata([h 'eeg-signals/assr/karol-siek-assr-1']);
%plot(data(25,:))
data(25,:) = data(25,:).^2;
data = sv_sig2trigg_kus(info,data,25,1);
plot(data(25,:));
title('Trigger');
q = find(data(25,:) == 1);
data = detrend(data);
data = bsxfun(@minus,data,(data(24,:)+data(23,:)/2));

data_plain = extract_epochs(data, q, [0,5], info.fs);
data_filtered = filter_data(data, info.fs, 2, [30, 50]);
data_final = extract_epochs(data_filtered, q, [-5, 10], info.fs);


save([h 'eeg-laboratory/erd-ers/assr/others.mat'], 'info', 'h');
save([h 'eeg-laboratory/erd-ers/assr/data_final_plain.mat'], 'data_plain', 'data_final');
