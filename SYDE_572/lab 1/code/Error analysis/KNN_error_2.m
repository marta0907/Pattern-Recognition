function [confusion_matrix,error] = KNN_error_2(number, class_a, class_b,test_a,test_b)

error_of_samples_a = 0;

for i=1:size(test_a,1)
   dist_to_a = KNN_dist(number,class_a,test_a(i,1),test_a(i,2));
   dist_to_b = KNN_dist(number,class_b,test_a(i,1),test_a(i,2));
   if dist_to_b < dist_to_a
       error_of_samples_a = error_of_samples_a + 1;
   end
end


error_of_samples_b = 0;

for i=1:size(test_b,1)
   dist_to_a = KNN_dist(number,class_a,test_b(i,1),test_b(i,2));
   dist_to_b = KNN_dist(number,class_b,test_b(i,1),test_b(i,2));
   if dist_to_b > dist_to_a
       error_of_samples_b = error_of_samples_b + 1;
   end
end


error = (error_of_samples_a+error_of_samples_b)/(size(test_a,1)+size(test_b,1));

AA = size(test_a,1) - error_of_samples_a;
AB = error_of_samples_a;
BA = error_of_samples_b;
BB = size(test_b,1)-error_of_samples_b;
confusion_matrix = [AA,AB, AA+AB; BA, BB, BA+ BB; AA+BA, AB+BB, AA+AB+BA+BB];
end