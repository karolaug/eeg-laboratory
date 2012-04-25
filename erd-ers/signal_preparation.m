addpath('/home/karolaug/Work/svarog2matlab/');
clear all
[info, data] = sv_loaddata('/home/karolaug/Work/eeg-signals/erd-ers/michal-czerwinski-erd-ers');
data = sv_sig2trigg_bool(data, 22);
%plot(data(22,:));
q = find(data(22,:) == 1);
for i=1:length(q),
    data_ref(i,:,:) = data(1:21,q(i)-4*info.fs:q(i)-2*info.fs);
    data_exp(i,:,:) = data(1:21,q(i)+0.5*info.fs:q(i)+2.5*info.fs);
end
clear data;
%size(data_ref)
%size(data_exp)
