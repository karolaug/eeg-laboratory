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


subplot(2,2,1)
plot(t,per_exp(9,:),'r',t,per_ref(9,:),'b')
axis([5,15,0,1500])
title('elektroda C3');
subplot(2,2,2)
plot(t,per_exp(11,:),'r',t,per_ref(11,:),'b')
axis([5,15,0,1500])
title('elektroda C4');

subplot(2,2,3)
plot(t,per_exp(9,:) - per_ref(9,:),'b')
axis([5,15,0,150])
title('roznica C3');
subplot(2,2,4)
plot(t,per_exp(11,:) - per_ref(11,:),'b')
axis([5,15,0,150])
title('roznica C4');
