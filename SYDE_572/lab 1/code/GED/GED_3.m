function [Z] = GED_3(z_c, z_d,z_e, D1,D2,D3,V1,V2,V3, num_c, num_d,num_e, X, Y)
    for i=1:numel(X)
        for j=1:numel(Y)
           dist_to_1 = GED_distance(z_c',[Y(j),X(i)]',D1,V1);
           dist_to_2 = GED_distance(z_d',[Y(j),X(i)]',D2,V2);
           dist_to_3 = GED_distance(z_e',[Y(j),X(i)]',D3,V3);
           if dist_to_1 < dist_to_2 && dist_to_1 < dist_to_3
               Z(i,j) = num_c;
           elseif dist_to_2 < dist_to_3 && dist_to_2 < dist_to_1
               Z(i,j) = num_d;
           elseif dist_to_3 < dist_to_2 && dist_to_3 < dist_to_1
               Z(i,j) = num_e;
           end
        end  
     end    
end