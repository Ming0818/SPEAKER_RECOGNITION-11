figure;

ydat=wavrecord(32000,16000);
xdat=1:length(ydat);
fpass_h=uicontrol('style','slider',...
                   'Min',0,'Max',1,'Value',0.2,'units','normalized','position',[0.01 0.95 0.2 0.05]);
label_h1=uicontrol('style','text','string','Fpass','units','normalized','position',[0.01 0.92 0.2 0.03]);  
                
                    
fstop_h=uicontrol('style','slider',...
                   'Min',0,'Max',1,'Value',0.5,'units','normalized','position',[0.01 0.85 0.2 0.05]);
label_h2=uicontrol('style','text','string','Fstop','units','normalized','position',[0.01 0.82 0.2 0.03]);  

fatt_h=uicontrol('style','slider',...
                   'Min',0,'Max',100,'Value',30,'units','normalized','position',[0.01 0.75 0.2 0.05]);
label_h3=uicontrol('style','text','string','Fattn','units','normalized','position',[0.01 0.72 0.2 0.03]);  

window_h=uicontrol('style','slider',...
                   'Min',0,'Max',2000,'Value',500,'units','normalized','position',[0.01 0.65 0.2 0.05]);
label_h4=uicontrol('style','text','string','Window Length','units','normalized','position',[0.01 0.62 0.2 0.03]);  

over_h=uicontrol('style','slider',...
                   'Min',0,'Max',2000,'Value',50,'units','normalized','position',[0.01 0.55 0.2 0.05]);
label_h5=uicontrol('style','text','string','Overlap','units','normalized','position',[0.01 0.52 0.2 0.03]);  

stft_h=uicontrol('style','slider',...
                   'Min',0,'Max',2000,'Value',500,'units','normalized','position',[0.01 0.45 0.2 0.05]);
label_h6=uicontrol('style','text','string','STFT points','units','normalized','position',[0.01 0.42 0.2 0.03]);  



ax1_h=axes('units','normalized','position',[0.25 0.05 0.74 0.9]);

upda_h=uicontrol('style','pushbutton','string','Update Filter','units','normalized','position',[0.01 0.1 0.2 0.05],'callback',{@updat12,fpass_h,fstop_h,fatt_h,ax1_h,xdat,ydat,window_h,over_h,stft_h,label_h1,label_h2,label_h3,label_h4,label_h5,label_h6});  
