function [mean_up,var_up] = emalgorithm(tempor,iter)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
evals=zeros(length(tempor),1);
pvals=zeros(length(tempor),1);
%tempor=[2; 4; 5; 3; 5]; 


%samp(:,20); % exaple taken (rows) for particular bin
mea=mean(tempor);
for iter=1:iter
  
  mea_matrix=repmat(mea,length(tempor),1);
  var_mat=(tempor-mea_matrix).^2;
  vare=mean(var_mat);
  pvals=guass(vare,mea,tempor);
  evals=pvals./sum(pvals);
  mean_updated=(sum(evals.*tempor))/(sum(evals));
 if(abs(mean_updated-mea)<0.0001)
      break;
 else
    mea=mean_updated; 
 end
end

mea_matrix=repmat(mea,length(tempor),1);
var_mat=(tempor-mea_matrix).^2;
mean_up=mea;
var_up=mean(var_mat);

end

