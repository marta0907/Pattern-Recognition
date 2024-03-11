function [Z] = KNN(number, class_a_clusters, class_b_clusters,X,Y)
 Z = zeros(size(X,2),size(Y,2));
  for i=1:numel(X)
    for j=1:numel(Y)
       dist_to_1_prototype = KNN_dist(number,class_a_clusters,Y(j),X(i));
       dist_to_2_prototype = KNN_dist(number,class_b_clusters,Y(j),X(i));
       if dist_to_1_prototype < dist_to_2_prototype
           Z(i,j) = 1;
       elseif dist_to_1_prototype > dist_to_2_prototype
           Z(i,j) = 2;
       else
           Z(i,j) = 0; %it's a boundary
       end
    end  
  end
end