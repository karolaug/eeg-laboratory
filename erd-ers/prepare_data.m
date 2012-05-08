function [data_] = prepare_data(data, q, time, fs)
    for i=1:length(q),
    data_(i,:,:) = data(1:21,q(i)+time(1)*fs:q(i)+time(2)*fs);
    end
for i=1:length(q),
    for j=1:21,
        data_(i,j,:) = detrend(data_(i,j,:));
    end
end