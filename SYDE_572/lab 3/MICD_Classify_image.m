function [res] = MICD_Classify_image(m,S,image)
len = length(image);
res = zeros(len,len);
for i = 1:len
    for j = 1:len
       point = squeeze(image(i,j,:));
       res(i,j) = Classify_point_MICD(m,S,point');
    end
end
end