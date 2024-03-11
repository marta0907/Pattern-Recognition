function [Z] = MAP(z_a,z_b, cov_a,cov_b,prob_a,prob_b, X,Y)
Z = zeros(size(X,2),size(Y,2));
for i=1:numel(X)
    for j=1:numel(Y)
        res = MAP_calc(z_a,z_b,[Y(j),X(i)],cov_a,cov_b,prob_a,prob_b);
       if res >= 0 
           Z(i,j) = 1;
       else
           Z(i,j) = 2;
       end
   end  
end    
end