


%5 x 150 matrix samp(5,150)
%first consider for 1 row sample
eval=zeros(5,1);
pvals=zeros(5,1);
tempor=[2; 4; 5; 3; 5]; 


%samp(:,20); % exaple taken (rows) for particular bin
mean_updated=mean(tempor);
for iter=1:1000
  mea=mean_updated;
  mea_matrix=repmat(mea,5,1);
  var_mat=(tempor-mea_matrix).^2;
  vare=mean(var_mat);
  pvals=guass(vare,mea,tempor);
  evals=pvals./sum(pvals);
  mean_updated=(sum(evals.*tempor))/(sum(evals));
 end