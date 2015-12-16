
y=wavrecord(32000,16000);
fs=16000;

soundsc(y,fs); % Let's hear it
% for classic look:

M = round(0.02*fs);  % 20 ms window is typical
N = 2^nextpow2(4*M); % zero padding for interpolation
w = 0.54 - 0.46 * cos(2*pi*[0:M-1]/(M-1)); % w = hamming(M);

spec=spectrogram(y,hanning(500),300,1000,16000);

title('Hi - This is <you-know-who> ');
ylim([0,(fs/2)/1000]); % don't plot neg. frequencies