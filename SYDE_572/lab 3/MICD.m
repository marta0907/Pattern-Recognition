function [boundaries] = MICD(m,S,x,y)
boundaries = zeros(length(x),length(y));
for i = 1:length(x)
    for j = 1:length(y)
       boundaries(i,j) = Classify_point_MICD(m,S,[x(i),y(j)]);
    end
end
end