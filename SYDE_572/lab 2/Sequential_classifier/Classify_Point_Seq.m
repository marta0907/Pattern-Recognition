function [res] = Classify_Point_Seq(x,y,G,n_aB,n_bA)
res =0; 
   for j=1:size(G,1)
            mu_a = [G(j,1),G(j,2)];
            mu_b = [G(j,3),G(j,4)];
            class = MED([x,y],mu_a,mu_b);
            if class == 1 && n_bA(j) == 0
                res = 1;
                break;
            elseif class == 2 && n_aB(j) == 0
                res = 2;
                break;
            end
   end
end