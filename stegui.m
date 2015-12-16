%%% 
figure;

ydat=wavrecord(32000,16000);
xdat=1:length(ydat);
fpass_h=uicontrol('style','slider',...
                   'Min',1,'Max',1000,'Value',150,'units','normalized','position',[0.01 0.95 0.2 0.05]);
label_h1=uicontrol('style','text','string','Window Length','units','normalized','position',[0.01 0.92 0.2 0.03]);  
                
                    
fstop_h=uicontrol('style','slider',...
                   'Min',1,'Max',1000,'Value',50,'units','normalized','position',[0.01 0.85 0.2 0.05]);
label_h2=uicontrol('style','text','string','Overlap','units','normalized','position',[0.01 0.82 0.2 0.03]);  

fatt_h=uicontrol('style','slider',...
                   'Min',1,'Max',10000,'Value',1000,'units','normalized','position',[0.01 0.75 0.2 0.05]);
label_h3=uicontrol('style','text','string','No USE','units','normalized','position',[0.01 0.72 0.2 0.03]);  

ax1_h=axes('units','normalized','position',[0.25 0.05 0.74 0.9]);
ax2_h=axes('units','normalized','position',[0.01 0.2 0.2 0.5]);
ydat=ydat';
upda_h=uicontrol('style','pushbutton','string','Update','units','normalized','position',[0.01 0.1 0.2 0.05],'callback',{@updatste,fpass_h,fstop_h,fatt_h,ax1_h,ax2_h,xdat,ydat});  
