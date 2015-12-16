


eval=zeros(length(tempor),1);
pvals=zeros(length(evals),1);
%tempor=[2; 4; 5; 3; 5]; 


%samp(:,20); % exaple taken (rows) for particular bin
mea=mean(tempor);
for iter=1:1000
  
  mea_matrix=repmat(mea,5,1);
  var_mat=(tempor-mea_matrix).^2;
  vare=mean(var_mat);
  pvals=guass(vare,mea,tempor);
  evals=pvals./sum(pvals);
  mean_updated=(sum(evals.*tempor))/(sum(evals));
  mea=mean_updated; 
end

mea_matrix=repmat(mea,5,1);
var_mat=(tempor-mea_matrix).^2;
vare=mean(var_mat);