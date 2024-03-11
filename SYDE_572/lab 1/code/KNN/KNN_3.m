function [Z] = KNN_3(number, class_a_clusters, class_b_clusters,class_c_clusters,X,Y)
 Z = zeros(size(X,2),size(Y,2));
  for i=1:numel(X)
    for j=1:numel(Y)
       dist_to_1_prototype = KNN_dist(number,class_a_clusters,Y(j),X(i));
       dist_to_2_prototype = KNN_dist(number,class_b_clusters,Y(j),X(i));
       dist_to_3_prototype = KNN_dist(number,class_c_clusters,Y(j),X(i));
       if dist_to_1_prototype < dist_to_2_prototype && dist_to_1_prototype < dist_to_3_prototype
           Z(i,j) = 1;
       elseif dist_to_2_prototype < dist_to_1_prototype && dist_to_2_prototype < dist_to_3_prototype
           Z(i,j) = 2;
       elseif dist_to_3_prototype < dist_to_2_prototype && dist_to_3_prototype < dist_to_1_prototype
           Z(i,j) = 3;
       end
    end  
  end
end