function [res] = Parzen_estimation_1D(data,h)
N = length(data);
max_data = max(data)+1;
region = 0:0.01:max_data;
res = zeros(size(region));
 for i=1:length(region)
     section = 0;
     for j=1:length(data)
        section = section + NormalPDF(region(i), data(j), h);
     end
     res(i) = section/N;
 end
end