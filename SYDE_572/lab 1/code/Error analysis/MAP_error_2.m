function [confusion_matrix,error] = MAP_error_2(clusters_a, clusters_b,mean_a,mean_b,cov_a,cov_b,prob_a,prob_b)

error_of_samples_a =0;

for i=1:size(clusters_a,1)
   a_or_b = MAP_calc(mean_a,mean_b,[clusters_a(i,1),clusters_a(i,2)],cov_a,cov_b,prob_a,prob_b);
   if a_or_b <0
       error_of_samples_a = error_of_samples_a + 1;
   end
end


error_of_samples_b = 0;

for i=1:size(clusters_b,1)
   a_or_b = MAP_calc(mean_a,mean_b,[clusters_b(i,1),clusters_b(i,2)],cov_a,cov_b,prob_a,prob_b);
   if a_or_b >=0
       error_of_samples_b = error_of_samples_b + 1;
   end
end


error = (error_of_samples_a+error_of_samples_b)/(size(clusters_a,1)+size(clusters_b,1));

AA = size(clusters_a,1) - error_of_samples_a;
AB = error_of_samples_a;
BA = error_of_samples_b;
BB = size(clusters_b,1)-error_of_samples_b;
confusion_matrix = [AA,AB, AA+AB; BA, BB, BA+ BB; AA+BA, AB+BB, AA+AB+BA+BB];

end