function [res] = Classify_Sequentially(x,y,G,n_aB,n_bA)
res = zeros(length(y),length(x));
    for i = 1:length(x)
        for k=1:length(y)
             res(k,i) = Classify_Point_Seq(x(i),y(k),G,n_aB,n_bA);
        end
    end
end