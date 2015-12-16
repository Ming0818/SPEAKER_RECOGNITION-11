load mfeatures.mat 
load vfeatures.mat 


% parameters
fpval=0.3;
fsval=0.43;
faval=50;
fwin=600;
fov=400;
fpo=600;

%---------------------------


disp('Press any key to Start Recording :')
pause;
for i=1:10
    disp('Speak Now:')
    wa=wavrecord(32000,16000);
     disp('Processing, Please Wait....');
    
    d=fdesign.lowpass('Fp,Fst,Ap,Ast',fpval,fsval,1,faval);
dt=design(d,'equiripple');
fil=dt.Numerator();
outpp=filter(fil,1,wa);
b=[1 -0.97];
outp=filter(b,1,outpp);




%xlim([0 10]);
%ylim([0 50]);
%ft=abs(fft(outp));
%ftt=ft(1:length(ft)/2);

S=spectrogram(outp,hanning(fwin),fov,fpo,16000);
S=S';
Sabs=abs(S);
Sreq=Sabs(:,1:fix(length(Sabs)/2));
freplot=sum(Sreq);
freplot=(freplot/max(freplot)).*100;






fnob=length(mean_fea); %no of mel filter banks
fstart=300;
fend=8000;

mstart=1125.*log(1+(fstart/700));
mend=1125.*log(1+(fend/700));


mvect=mstart:(mend-mstart)/(fnob+2):mend;

fvect=floor(700.*(exp(mvect/1125)-1));
fbins=floor(fvect.*(length(freplot)/8000));

save fb.mat fbins
% apply filter

    mfcoeef=zeros(1,fnob);
    for fbo=1:fnob
        mfcoeef(1,fbo)=onemffc(fbins(1,fbo),fbins(1,fbo+1),fbins(1,fbo+2),freplot(1,fbins(1,fbo):fbins(1,fbo+2)));
    end 
 mfcoeef=dct(log(mfcoeef));
%%%disp probability value
   ma=0;
   ind=0;
disp('Processing Finished. Probability of matching');
pmat=zeros(5,length(mfcoeef));
pmat(1,:)=guass(var_fea(1,:),mean_fea(1,:),mfcoeef);
pmat(2,:)=guass(var_fea(2,:),mean_fea(2,:),mfcoeef);
pmat(3,:)=guass(var_fea(3,:),mean_fea(3,:),mfcoeef);
pmat(4,:)=guass(var_fea(4,:),mean_fea(4,:),mfcoeef);
pmat(5,:)=guass(var_fea(5,:),mean_fea(5,:),mfcoeef);
tempo=zeros(size(pmat,1),1);
for ii=1:length(pmat)
    tempo=pmat(:,ii);
    [ma, ind]=max(tempo);
    tempo=zeros(length(tempo),1);
    tempo(ind,1)=1;
       pmat(:,ii)=tempo;    
end
[mm, no]=max( [sum(pmat(1,:)),sum(pmat(2,:)),sum(pmat(3,:)),sum(pmat(4,:)),sum(pmat(5,:))]);
disp('You spoke :  ');
disp(no);
disp('press any key to continue');
pause;
end

