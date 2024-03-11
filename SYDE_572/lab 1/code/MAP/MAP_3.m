function [Z] = MAP_3(z_c,z_d,z_e, cov_c,cov_d,cov_e, prob_c,prob_d,prob_e, X,Y)
Z = zeros(size(X,2),size(Y,2));
for i=1:numel(X)
    for j=1:numel(Y)
        resCD = MAP_calc(z_c,z_d,[Y(j),X(i)],cov_c,cov_d,prob_c,prob_d);
        resCE = MAP_calc(z_c,z_e,[Y(j),X(i)],cov_c,cov_e,prob_c,prob_e);
        resDE = MAP_calc(z_d,z_e,[Y(j),X(i)],cov_d,cov_e,prob_d,prob_e);
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