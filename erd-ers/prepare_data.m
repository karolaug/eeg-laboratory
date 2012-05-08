function [data_ref, data_exp] = prepare_data(data, q, fs)
    for i=1:length(q),
    data_ref(i,:,:) = data(1:21,q(i)-4*fs:q(i)-2*fs);
    data_exp(i,:,:) = data(1:21,q(i)+0.5*fs:q(i)+2.5*fs);
    end
for i=1:60,
    for j=1:21,
        data_exp(i,j,:) = detrend(data_exp(i,j,:));
        data_ref(i,j,:) = detrend(data_ref(i,j,:));
    end
end