function data = filter_data(data, fs, N, Wn)
    
    Wn = Wn * (fs/2);
    [B, A] = butter(N, Wn);
    s = size(data);
    for i=1:s(1)
        data(i,:) = filtfilt(B, A, data(i,:));
    end
    