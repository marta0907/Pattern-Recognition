function [dist] = MED_distance(mean,X,Y)
   dist = sqrt((X-mean(1)).^2+(Y-mean(2)).^2);
end