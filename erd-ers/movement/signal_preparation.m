addpath('/home/karolaug/Work/svarog2matlab/');
clear all
h = '/home/karolaug/Work/';
[info, data] = sv_loaddata([h 'eeg-signals/erd-ers/michal-czerwinski-erd-ers']);
data = sv_sig2trigg_bool(data, 22);
%plot(data(22,:));
q = find(data(22,:) == 1);
data = detrend(data);
t = linspace(0,info.fs, 513);
data = bsxfun(@minus,data,(data(20,:)+data(21,:)/2));
data_ref = extract_epochs(data, q, [-4,-2], info.fs);
data_exp = extract_epochs(data, q, [0.5, 2.5], info.fs);
save([h 'eeg-laboratory/erd-ers/movement/data_epochs_non_filter.mat'],'data_ref', 'data_exp');
save([h,'eeg-laboratory/erd-ers/movement/others.mat'], 'info', 't');

data_mu = filter_data(data, info.fs, 2, [8, 15]);
data_beta = filter_data(data, info.fs, 2, [18, 25]);

data_mu = extract_epochs(data_mu, q, [-5, 5], info.fs);
data_beta = extract_epochs(data_beta, q, [-5, 5], info.fs);

save([h 'eeg-laboratory/erd-ers/movement/data_epochs_mu_and_beta.mat'], 'data_mu', 'data_beta');

clear all
%info.numchans = 21;
%info.channames(22:end) = [];
%info.gain(22:end) = [];
%info.offset(22:end) = [];
