function[m , S] = MICD_Discriminant(f,num_of_images,num_of_blocks)
    m = zeros(num_of_images,2);
    S = zeros(num_of_images, 2, 2);
    for i = 1:num_of_images
        pts = f(1:2,(num_of_blocks*(i-1)+1):(num_of_blocks*i));
        m(i,:) = mean(pts,2);
        S(i,:,:) = cov(pts');
    end
end