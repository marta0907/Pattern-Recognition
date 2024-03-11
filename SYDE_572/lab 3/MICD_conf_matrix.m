function [conf_matrix] = MICD_conf_matrix(m,S,f)
conf_matrix = zeros(10,10);
for i = 1:10
  pts = f(1:2,(16*(i-1)+1):(16*i));
  for j = 1:length(pts)
      class = Classify_point_MICD(m,S,pts(:,j)');
      conf_matrix(i,class) = conf_matrix(i,class) +1;
  end
end
end