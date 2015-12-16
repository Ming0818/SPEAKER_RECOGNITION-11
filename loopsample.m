

  %%% samples of each word

% parameters
fpval=0.3;
fsval=0.43;
faval=50;
fwin=600;
fov=400;
fpo=600;
choice='n';
prompt = 'Enter "R" to retain sample or "D" to discard sample           ';
str='D';
%--------------------------mfcc filter bank---------------------
fnob=10;
mfcoeef=zeros(1,fnob);
sample_array=zeros(5,fnob);

mean_fea=zeros(5,fnob);
var_fea=zeros(5,fnob);

%no of mel filter banks
    fstart=200;
    fend=8000;

    mstart=1125.*log(1+(fstart/700));
    mend=1125.*log(1+(fend/700));


    mvect=mstart:(mend-mstart)/(fnob+2):mend;

    fvect=floor(700.*(exp(mvect/1125)-1));
   
    
    fbins=floor(fvect.*(150/8000)); %%%% remeber to change '150' here in case of different STFT window length 


%--------------------------------------------------------------


for j=1:5
    

disp('Press any key to Start Recording of word-------------------------------NEW WORD BEGINS:')
disp(j);
pause;
for i=1:5
    disp('Recording 2 sec of Sample....');
    disp(i);
        while(str=='D' || str=='d')
             disp('Start speaking...'); 
             twa=wavrecord(32000,16000);
             disp('Sample acquired');
            soundsc(twa,16000);
             
             
             str = input(prompt,'s');
             if str=='R' || str=='r' 
              wa=twa;
             end
        end
        str='d';
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
    Sreq=Sabs(:,1:length(Sabs)/2);
    freplot=sum(Sreq);
    freplot=(freplot/max(freplot)).*100;
     %mel filter
    
  %  save fb.mat fbins
    % apply filter
    
    for fbo=1:fnob
        mfcoeef(1,fbo)=onemffc(fbins(1,fbo),fbins(1,fbo+1),fbins(1,fbo+2),freplot(1,fbins(1,fbo):fbins(1,fbo+2)));
    end 
    mfcoeef=dct(log(mfcoeef));
    
    
    
    sample_array(i,:)=mfcoeef;
    disp('Sample Processing Finished. Press any key to continue..');
    pause;
end



%%anomaly detection algoritm with guassian distribution
    for xscan=1:size(sample_array,2)
        tempra=sample_array(:,xscan);
        [mean_fea(j,xscan),var_fea(j,xscan)]=emalgorithm(tempra,100);  
    
      
    %mean_fea(j,:)=sum(sample_array)/size(sample_array,1);
    %    mean_fea1=repmat(mean_fea(j,:),size(sample_array,1),1);
    %var_fea1=(sample_array-mean_fea1).^2;
    %var_fea(j,:)=sum(var_fea1)/size(sample_array,1);

    end
end

save mfeatures.mat mean_fea
save vfeatures.mat var_fea
