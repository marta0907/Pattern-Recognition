function [Z] = MED(mean_1,mean_2,X,Y,num_1,num_2)
    Z = zeros(size(X,2),size(Y,2));
    for i=1:numel(X)
        for j=1:numel(Y)
           dist_to_1_prototype = MED_distance(mean_1,Y(j),X(i));
           dist_to_2_prototype = MED_distance(mean_2,Y(j),X(i));
           if dist_to_1_prototype < dist_to_2_prototype
               Z(i,j) = num_1;
           else
               Z(i,j) = num_2;
           end
       end  
    end    
end
