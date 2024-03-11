function[min_er, max_er, avarage_er, stdev_er] = Error_Rate_of_sequential_classifier(a,b,J,limit)
min_er = zeros(J);
max_er = zeros(J);
avarage_er = zeros(J);
stdev_er = zeros(J);
    for j =1:J
        errors = [];
        for k = 1:limit
            [G,n_aB,n_bA] = Sequential_Discriminant(a,b,j);
             mistakes = 0;
            for i=1:size(a,1)
                class = Classify_Point_Seq(a(i,1),a(i,2),G,n_aB,n_bA);
                if class ~= 1
                    mistakes = mistakes+1;
                end
            end
            for i=1:size(b,1)
                class = Classify_Point_Seq(b(i,1),b(i,2),G,n_aB,n_bA);
                if class ~= 2
                    mistakes = mistakes+1;
                end
            end
            errors(k) = mistakes/(size(a,1)+size(b,1));
        end
        min_er(j) = min(errors);
        max_er(j) = max(errors);
        avarage_er(j) = mean(errors);
        stdev_er(j) =std(errors);
    end
end