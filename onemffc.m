function coefsum = onemffc(fstart,fmiddle,fend,samp)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
rup=fstart:fmiddle;
fup=(rup-fstart)/(fmiddle-fstart);
rdwn=fmiddle+1:fend;
fdwn=(fend-rdwn)/(fend-fmiddle);
fvect=[fup,fdwn];

coefsum=sum(fvect.*samp);
end

