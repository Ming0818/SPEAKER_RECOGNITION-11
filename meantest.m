

result=1:64000;
index=1;

for we=1:64000
    if(mod(we,2000)==0)
    index=index+1;  

    end
result(1,we)=index;
end
plot(result);