function [classes, prototypes] = K_Means(f,K)
    len = length(f);
    rand = randperm(len,K);
    prototypes = zeros(2,K);
    for i=1:K
        prototypes(:,i) = squeeze(f(1:2,rand(i)));
    end
    
    classes = zeros(3,len);
    while true
        for i =1:len 
            point = squeeze(f(1:2, i));
            dist = zeros(10,1);
            for j =1:K
                prot_j = squeeze(prototypes(:,j));
                dist(j) = Get_Dist(point, prot_j);
            end
           [~, class] = min(dist);
           classes(1:2,i) = point;
           classes(3,i) = class;
        end
        new_prototypes = zeros(2,K);
        for i =1:K 
            class_i = classes(1:2,classes(3,:)==i);
            new_prototypes(:,i) = mean(class_i,2);
        end
        
        if prototypes == new_prototypes 
            break;
        end
        prototypes = new_prototypes;
    
    end
end