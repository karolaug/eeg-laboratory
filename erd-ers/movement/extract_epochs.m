function [data_] = extract_epochs(data, q, time, fs)
    for i=1:length(q),
    data_(i,:,:) = data(1:end,q(i)+time(1)*fs:q(i)+time(2)*fs);
    end
a = size(data_);
for i=1:length(q),
    for j=1:a(2),
        data_(i,j,:) = detrend(data_(i,j,:));
    end
end