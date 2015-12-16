
N=32000;
fs=16000;
we=wavrecord(N,fs);
we=we';

win_length=800;

overlap=300;

impute(we,win_length,overlap);
% current_head=1;
% wins=fix((N-win_length)/(win_length-overlap));  % calculation of windows
% wins=wins+1; % additional two windows are required
% val=zeros(1,wins);
% 
% for index=1:wins
%   if(index==wins)
%     val(index)=sum(we(current_head:N));    
%   else
%     val(index)=sum(we(current_head:current_head+win_length-1));
%   end
%  current_head=current_head+win_length-overlap;
% end
% plot(val);



