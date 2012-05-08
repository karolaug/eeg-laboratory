function [data_ref, data_exp] = prepare_data(data, q, info)
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