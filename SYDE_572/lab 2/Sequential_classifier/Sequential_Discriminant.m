function [G, n_aB,n_bA] = Sequential_Discriminant(a,b,J)
    G = [];
    n_aB = [];
    n_bA = [];
    j =1;
    mu_a =[0,0];
    mu_b = [0,0];
    while(~isempty(a) && ~isempty(b))
     
        if ~isempty(a)
            r1 = randi([1 size(a,1)]);
            mu_a_j = a(r1,:);
            mu_a = mu_a_j;
        end
        if ~isempty(b)
            r2 = randi([1 size(b,1)]);
            mu_b_j = b(r2,:);
            mu_b = mu_b_j;
        end
        
        bA_j = []; %incorrectly classified points in b as class A
        aB_j = []; %incorrectly classified points in a as class B
   
        for i=1:size(a,1)
            class = MED(a(i,:),mu_a,mu_b);
            if class == 2
                aB_j(end+1,:) = a(i,:);
            end
        end
    
        for i=1:size(b,1)
            class = MED(b(i,:),mu_b,mu_a);
            if class == 2
                bA_j(end+1,:) = b(i,:);
            end
        end

        if ~isempty(aB_j) && ~isempty(bA_j)
            continue;
        else
            if isempty(aB_j)
                b = bA_j;
            end
            if isempty(bA_j)
                a = aB_j;
            end
        end
       G(j,:) = [mu_a,mu_b];
       n_aB(j) = length(aB_j);
       n_bA(j) = length(bA_j);
       j = j+1;
       if(J ~= 0 && j >=J)
           break;
       end
    end  
end