function [confusion_matrix,error] = MED_error_3(clusters_c, clusters_d,clusters_e,mean_c,mean_d,mean_e)

error_of_samples_c_in_d =0;
error_of_samples_c_in_e =0;
for i=1:size(clusters_c,1)
   dist_to_c = MED_distance(mean_c,clusters_c(i,1),clusters_c(i,2));
   dist_to_d = MED_distance(mean_d,clusters_c(i,1),clusters_c(i,2));
   dist_to_e = MED_distance(mean_e,clusters_c(i,1),clusters_c(i,2));
  
   if dist_to_d < dist_to_c && dist_to_d < dist_to_e
       error_of_samples_c_in_d = error_of_samples_c_in_d + 1;
   elseif dist_to_e < dist_to_c && dist_to_e < dist_to_d
       error_of_samples_c_in_e = error_of_samples_c_in_e + 1;
   end
end

error_of_samples_d_in_c =0;
error_of_samples_d_in_e =0;
for i=1:size(clusters_d,1)
   dist_to_c = MED_distance(mean_c,clusters_d(i,1),clusters_d(i,2));
   dist_to_d = MED_distance(mean_d,clusters_d(i,1),clusters_d(i,2));
   dist_to_e = MED_distance(mean_e,clusters_d(i,1),clusters_d(i,2));
  
   if dist_to_c < dist_to_d && dist_to_c < dist_to_e
       error_of_samples_d_in_c = error_of_samples_d_in_c + 1;
   elseif dist_to_e < dist_to_c && dist_to_e < dist_to_d
       error_of_samples_d_in_e = error_of_samples_d_in_e + 1;
   end
end

error_of_samples_e_in_c =0;
error_of_samples_e_in_d =0;
for i=1:size(clusters_e,1)
   dist_to_c = MED_distance(mean_c,clusters_e(i,1),clusters_e(i,2));
   dist_to_d = MED_distance(mean_d,clusters_e(i,1),clusters_e(i,2));
   dist_to_e = MED_distance(mean_e,clusters_e(i,1),clusters_e(i,2));
  
   if dist_to_d < dist_to_c && dist_to_d < dist_to_e
       error_of_samples_e_in_d = error_of_samples_e_in_d + 1;
   elseif dist_to_c < dist_to_e && dist_to_c < dist_to_d
       error_of_samples_e_in_c = error_of_samples_e_in_c + 1;
   end
end

total_num = size(clusters_c,1)+size(clusters_d,1)+size(clusters_e,1);

error = (error_of_samples_c_in_d+error_of_samples_c_in_e + ...
    error_of_samples_d_in_c +  error_of_samples_d_in_e + ...
    error_of_samples_e_in_c +  error_of_samples_e_in_d)/ total_num;

CC = size(clusters_c,1) - error_of_samples_c_in_d - error_of_samples_c_in_e;
CD = error_of_samples_c_in_d;
CE = error_of_samples_c_in_e;

DC = error_of_samples_d_in_c;
DD = size(clusters_d,1) - error_of_samples_d_in_c - error_of_samples_d_in_e;
DE = error_of_samples_d_in_e;

EC = error_of_samples_e_in_c;
ED = error_of_samples_e_in_d;
EE = size(clusters_e,1) - error_of_samples_e_in_c - error_of_samples_e_in_d;

confusion_matrix = [CC, CD, CE, CC+CD+CE; 
    DC,DD,DE,DC+DD+DE; 
    EC,ED,EE, EC+ED+EE; 
    CC+DC+EC, CD+DD+ED, CE+DE+EE,CC+CD+CE+DC+DD+DE+EC+ED+EE];

end