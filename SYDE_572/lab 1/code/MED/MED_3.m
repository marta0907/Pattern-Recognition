function Z = MED_3(mean_1,mean_2,mean_3,X,Y,num_1,num_2, num_3)
    Z = zeros(size(X,2),size(Y,2));
    for i=1:numel(X)
        for j=1:numel(Y)
           dist_to_1_prototype = MED_distance(mean_1,Y(j),X(i));
           dist_to_2_prototype = MED_distance(mean_2,Y(j),X(i));
           dist_to_3_prototype = MED_distance(mean_3,Y(j),X(i));
           if (dist_to_1_prototype < dist_to_2_prototype) && (dist_to_1_prototype < dist_to_3_prototype)
               Z(i,j) = num_1;
           elseif (dist_to_2_prototype < dist_to_3_prototype) && (dist_to_2_prototype < dist_to_1_prototype)
               Z(i,j) = num_2;
           elseif (dist_to_3_prototype < dist_to_2_prototype) && (dist_to_3_prototype < dist_to_1_prototype)
               Z(i,j) = num_3;
           end
       end  
    end    
end