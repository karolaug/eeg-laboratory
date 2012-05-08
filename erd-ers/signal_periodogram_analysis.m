clear all
h = '/home/karolaug/Work/';
load([h 'eeg-laboratory/erd-ers/data_non_filter.mat']);
load([h 'eeg-laboratory/erd-ers/others.mat']);

for i=1:60,
    for j=1:21,
        data_exp_per(i,j,:) = periodogram(data_exp(i,j,:));
        data_ref_per(i,j,:) = periodogram(data_ref(i,j,:));
    end
end

per_exp = abs(squeeze(mean(data_exp_per,1)));
per_ref = abs(squeeze(mean(data_ref_per,1)));


subplot(2,2,1)
plot(t,per_exp(9,:),'r',t,per_ref(9,:),'b')
axis([0,40,0,2500])
title('elektroda C3');
subplot(2,2,2)
plot(t,per_exp(11,:),'r',t,per_ref(11,:),'b')
axis([0,40,0,2500])
title('elektroda C4');

subplot(2,2,3)
plot(t,per_exp(9,:) - per_ref(9,:),'b')
axis([0,40,0,250])
title('roznica C3');
subplot(2,2,4)
plot(t,per_exp(11,:) - per_ref(11,:),'b')
axis([0,40,0,250])
title('roznica C4');
