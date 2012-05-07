addpath('/home/karolaug/Work/svarog2matlab/');
clear all
h = '/home/karolaug/Work/';
[info, data] = sv_loaddata([h 'eeg-signals/erd-ers/michal-czerwinski-erd-ers']);
data = sv_sig2trigg_bool(data, 22);
%plot(data(22,:));
q = find(data(22,:) == 1);
data = detrend(data);
t = linspace(1,256, 513);

data = bsxfun(@minus,data,(data(20,:)+data(21,:)/2));

for i=1:length(q),
    data_ref(i,:,:) = data(1:21,q(i)-4*info.fs:q(i)-2*info.fs);
    data_exp(i,:,:) = data(1:21,q(i)+0.5*info.fs:q(i)+2.5*info.fs);
end
for i=1:60,
    for j=1:21,
        data_exp(i,j,:) = detrend(data_exp(i,j,:));
        data_ref(i,j,:) = detrend(data_ref(i,j,:));
    end
end
    clear data;
clear i;
clear q;
info.numchans = 21;
info.channames(22:end) = [];
info.gain(22:end) = [];
info.offset(22:end) = [];

save([h 'eeg-laboratory/erd-ers/data.mat']);
