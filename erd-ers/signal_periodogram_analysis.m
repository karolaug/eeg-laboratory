clear all
h = '/home/karolaug/Work/';
load([h 'eeg-laboratory/erd-ers/data.mat']);

for i=1:60,
    for j=1:21,
        data_exp_per(i,j,:) = periodogram(data_exp(i,j,:));
        data_ref_per(i,j,:) = periodogram(data_ref(i,j,:));
    end
end

per_exp = real(squeeze(mean(data_exp_per,1)));
per_ref = real(squeeze(mean(data_ref_per,1)));

plot(t,per_exp(9,:))