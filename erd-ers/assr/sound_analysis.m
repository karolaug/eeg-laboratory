clear all
h = '/home/karolaug/Work/';
[sound, fs, bits] = wavread([h, 'MM40tr.wav'], 'native');
sound = double(sound');
sound_kus(1,:) = sound(2,:).^2;
q = find(sound_kus(1,1:end-1)-sound_kus(1,2:end)>0.08);
u = find(q(2:end) - q(1:end-1)>5*fs);
q(u) = [];
sound_kus(1,1:end) = 0;
sound_kus(1,q) = 1;


sound_fft = fft(sound, [], 2);
t = linspace(0, fs, length(sound_fft));
%subplot(2,1,1)
%plot(sound_kus(1,:))
%xlim([0,2000])
%subplot(2,1,2)
plot(t, abs(sound_fft(1,:)))
xlim([0,500]);



