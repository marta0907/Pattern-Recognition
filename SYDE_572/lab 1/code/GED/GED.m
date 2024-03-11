function [Z] = GED(z_a, z_b, D1,D2,V1,V2, num_a, num_b, X, Y)
    for i=1:numel(X)
        for j=1:numel(Y)
           dist_to_1_prototype = GED_distance(z_a',[Y(j),X(i)]',D1,V1);
           dist_to_2_prototype = GED_distance(z_b',[Y(j),X(i)]',D2,V2);
           if dist_to_1_prototype < dist_to_2_prototype
               Z(i,j) = num_a;
           else
               Z(i,j) = num_b;
           end
        end  
     end    
end