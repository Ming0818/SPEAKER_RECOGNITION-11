function impute( we,win_length,overlap )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
N=length(we);
wins=fix((N-win_length)/(win_length-overlap));  % calculation of windows
wins=wins+1; % additional two windows are required
val=zeros(1,wins);
current_head=1;

for index=1:wins
  if(index==wins)
    val(index)=sum(we(current_head:N));    
  else
    val(index)=sum(we(current_head:current_head+win_length-1));
  end;
 current_head=current_head+win_length-overlap;
end;
plot(val);



end

