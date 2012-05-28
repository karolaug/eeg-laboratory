clear all
h = '/home/karolaug/Work/';
load([h 'eeg-laboratory/erd-ers/data_epochs_mu_and_beta.mat']);
load([h 'eeg-laboratory/erd-ers/others.mat']);

data_beta = data_beta.^2;
data_mu = data_mu.^2;

data_beta = squeeze(mean(data_beta,1));
data_mu = squeeze(mean(data_mu,1));

ref_beta = mean(data_beta(:,1*info.fs:3*info.fs),2);
ref_mu = mean(data_mu(:,1*info.fs:3*info.fs),2);

data_beta = bsxfun(@minus, data_beta, ref_beta);
data_mu = bsxfun(@minus, data_mu, ref_mu);
data_beta = bsxfun(@(x,y) x./y, data_beta, ref_beta);
data_mu = bsxfun(@(x,y) x./y, data_mu, ref_mu);
