function [mean_dist_to_k] = KNN_dist(number,class_a_clusters,X,Y)
    
    for i=1:size(class_a_clusters,1)
        class_a_clusters(i,3) = sqrt((X-class_a_clusters(i,1)).^2+(Y-class_a_clusters(i,2)).^2);
    end
    class_a_clusters_sorted = sortrows(class_a_clusters,3);
    closest_clusters = class_a_clusters_sorted(1:number,1:2);
    mean_x = 0;
    mean_y = 0;
    for i=1:size(closest_clusters,1)
    mean_x  = mean_x  + closest_clusters(i,1);
    mean_y  = mean_y  + closest_clusters(i,2);
    end
mean_x = mean_x/size(closest_clusters,1);
mean_y = mean_y/size(closest_clusters,1);

mean_dist_to_k = sqrt((X-mean_x).^2+(Y-mean_y).^2);
end