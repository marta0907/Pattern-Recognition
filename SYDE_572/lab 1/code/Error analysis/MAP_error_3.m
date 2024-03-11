function [confusion_matrix,error] = MAP_error_3(clusters_c, clusters_d,clusters_e,mean_c,mean_d,mean_e,cov_c,cov_d,cov_e,prob_c,prob_d,prob_e)

c_in_d =0;
c_in_e =0;
for i=1:size(clusters_c,1)
   c_or_d = MAP_calc(mean_c,mean_d,[clusters_c(i,1),clusters_c(i,2)],cov_c,cov_d,prob_c,prob_d);
   c_or_e = MAP_calc(mean_c,mean_e,[clusters_c(i,1),clusters_c(i,2)],cov_c,cov_e,prob_c,prob_e);
   d_or_e = MAP_calc(mean_d,mean_e,[clusters_c(i,1),clusters_c(i,2)],cov_d,cov_e,prob_d,prob_e);

   if c_or_d < 0 && d_or_e >=0
       c_in_d = c_in_d + 1;
   elseif c_or_e <0 && d_or_e < 0
       c_in_e = c_in_e + 1;
   end
end

d_in_c =0;
d_in_e =0;
for i=1:size(clusters_d,1)
   c_or_d = MAP_calc(mean_c,mean_d,[clusters_d(i,1),clusters_d(i,2)],cov_c,cov_d,prob_c,prob_d);
   c_or_e = MAP_calc(mean_c,mean_e,[clusters_d(i,1),clusters_d(i,2)],cov_c,cov_e,prob_c,prob_e);
   d_or_e = MAP_calc(mean_d,mean_e,[clusters_d(i,1),clusters_d(i,2)],cov_d,cov_e,prob_d,prob_e);

   if c_or_d >=0 && c_or_e >=0
       d_in_c = d_in_c + 1;
   elseif c_or_e <0 && d_or_e <0
       d_in_e = c_in_e + 1;
   end
end

e_in_c =0;
e_in_d =0;
for i=1:size(clusters_e,1)
   c_or_d = MAP_calc(mean_c,mean_d,[clusters_e(i,1),clusters_e(i,2)],cov_c,cov_d,prob_c,prob_d);
   c_or_e = MAP_calc(mean_c,mean_e,[clusters_e(i,1),clusters_e(i,2)],cov_c,cov_e,prob_c,prob_e);
   d_or_e = MAP_calc(mean_d,mean_e,[clusters_e(i,1),clusters_e(i,2)],cov_d,cov_e,prob_d,prob_e);

   if c_or_d <0 && d_or_e >=0
       e_in_d = e_in_d + 1;
   elseif c_or_e >=0 && c_or_d >=0
       e_in_c = e_in_c + 1;
   end
end

total_num = size(clusters_c,1)+size(clusters_d,1)+size(clusters_e,1);

error = (c_in_d+c_in_e + ...
    d_in_c +  d_in_e + ...
    e_in_c +  e_in_d)/ total_num;

CC = size(clusters_c,1) - c_in_d - c_in_e;
CD = c_in_d;
CE = c_in_e;

DC = d_in_c;
DD = size(clusters_d,1) - d_in_c - d_in_e;
DE = d_in_e;

EC = e_in_c;
ED = e_in_d;
EE = size(clusters_e,1) - e_in_c - e_in_d;

confusion_matrix = [CC, CD, CE, CC+CD+CE; 
    DC,DD,DE,DC+DD+DE; 
    EC,ED,EE, EC+ED+EE; 
    CC+DC+EC, CD+DD+ED, CE+DE+EE,CC+CD+CE+DC+DD+DE+EC+ED+EE];
end