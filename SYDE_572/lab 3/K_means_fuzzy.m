function [classes, prototypes] = K_means_fuzzy(f,K,b)
    len = length(f);
    rand = randperm(len,K);
    prototypes = zeros(2,K);
    for i=1:K
        prototypes(:,i) = squeeze(f(1:2,rand(i)));
    end
    
    classes = zeros(2+b,len);
    while true
        for i =1:len 
            point = squeeze(f(1:2, i));
            dist = zeros(10,1);
            for j =1:K
                prot_j = squeeze(prototypes(:,j));
                dist(j) = Get_Dist(point, prot_j);
            end
           [~, class] = mink(dist,b);
           classes(1:2,i) = point;
           classes(3:(3+(b-1)),i) = class';
        end
        new_prototypes = zeros(2,K);
        for i =1:K 
            class_i = classes(1:2,classes(3,:)==i)';
            for j =2:b
               class_i =union(class_i, classes(1:2,classes(3+(j-1),:)==i)',"rows");
            end
            new_prototypes(:,i) = mean(class_i,1);
        end
        
        if prototypes == new_prototypes 
            break;
        end
        prototypes = new_prototypes;
    
    end
end