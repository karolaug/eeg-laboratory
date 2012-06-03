clear all
h = '/home/karolaug/Work/';
[sound, fs, bits] = wavread([h, 'MM40tr.wav']);
sound_fft = fft(sound, [], 1);
t = linspace(0, fs/2, length(sound_fft));
subplot(2,1,1)
plot(t, abs(sound(:,1)))
%xlim([0,2000])
subplot(2,1,2)
plot(t, abs(sound_fft(:,1)))
xlim([0,100]);



