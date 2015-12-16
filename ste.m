sample=wavrecord(32000,16000);
sample=sample';
win_length=100;
current_head=1;
index=1;
val=zeros(1,10000);
overlap=50;
while((current_head+win_length)<32000)
val(index)=sum(sample(current_head:current_head+win_length));
current_head=current_head+win_length-overlap;

    if(current_head+win_length>32000)
        val(index)=sum(sample(current_head:32000));
    end
index=index+1;
end




