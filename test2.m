
yda=wavrecord(32000,16000);
b=[1 -0.97];
outp=filter(b,1,yda);



S=spectrogram(outp,hanning(560),300,560,16000);
S=S';
Sabs=abs(S);
Sreq=Sabs(:,1:length(Sabs)/2);
fplot=sum(Sreq);
fplot=(fplot/max(fplot)).*100;
subplot(2,1,1);
plot(fplot);

subplot(2,1,2);
windowed_mean(fplot,20,2);


