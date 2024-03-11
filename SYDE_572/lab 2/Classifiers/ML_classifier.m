function [Z] = ML_classifier(z_c,z_d,z_e, cov_c,cov_d,cov_e, X,Y)
Z = zeros(length(X),length(Y));
for i=1:numel(X)
    for j=1:numel(Y)
        resCD = ML_calc(z_c,z_d,[Y(j),X(i)],cov_c,cov_d);
        resCE = ML_calc(z_c,z_e,[Y(j),X(i)],cov_c,cov_e);
        resDE = ML_calc(z_d,z_e,[Y(j),X(i)],cov_d,cov_e);
       if resCD >=0  && resCE >= 0
          Z(i,j) = 1;
       elseif resCD <0 && resDE >=0
           Z(i,j) = 2;
       elseif resCE < 0 && resDE <0 
          Z(i,j) = 3;
       end
   end  
end    
end