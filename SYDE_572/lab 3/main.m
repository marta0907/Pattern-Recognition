close all;
clear;
load("feat.mat");
addpath("./images/");

%% MICD for blocks 2x2

[m2,S2] = MICD_Discriminant(f2,10,16);

step =0.01;
x_min = min([f2(1,:) f2t(1,:)]) - step;
x_max = max([f2(1,:) f2t(1,:)]) + step;
y_min = min([f2(2,:) f2t(2,:)]) - step;
y_max = max([f2(2,:) f2t(2,:)]) + step;

x = x_min:step:x_max;
y = y_min:step:y_max;

[boundaries2] = MICD(m2,S2,x,y);

figure(1);
hold on;
title('MICD decision boundary for blocks 2x2')
xlabel('feature 1')
ylabel('feature 2')
contourf(x,y,boundaries2','Color', 'black');
colorbar
for i =1:10 
    pts = f2(1:2,(16*(i-1)+1):(16*i));
    scat_pts = scatter(pts(1,:), pts(2,:),30,'*');
end
legend("boundary",'Location','northwest')
hold off;


conf_matrix2 = MICD_conf_matrix(m2,S2,f2t);
disp("confusion matrix for blocks 2x2");
disp(conf_matrix2);


%% MICD for blocks 8x8

[m8,S8] = MICD_Discriminant(f8,10,16);

x_min = min([f8(1,:) f8t(1,:)]) - step;
x_max = max([f8(1,:) f8t(1,:)]) + step;
y_min = min([f8(2,:) f8t(2,:)]) - step;
y_max = max([f8(2,:) f8t(2,:)]) + step;

x = x_min:step:x_max;
y = y_min:step:y_max;

[boundaries8] = MICD(m8,S8,x,y);

figure(2);
hold on;
title('MICD decision boundary for blocks 8x8')
xlabel('feature 1')
ylabel('feature 2')
contourf(x,y,boundaries8',10,'Color', 'black');
colorbar
for i =1:10 
    pts = f8(1:2,(16*(i-1)+1):(16*i));
    scat_pts = scatter(pts(1,:), pts(2,:),30,'*');
end
legend("boundary",'Location','northwest')
hold off;



conf_matrix8 = MICD_conf_matrix(m8,S8,f8t);
disp("confusion matrix for blocks 8x8");
disp(conf_matrix8);



%% MICD for blocks 32x32

[m32,S32] = MICD_Discriminant(f32,10,16);


x_min = min([f32(1,:) f32t(1,:)]) - step;
x_max = max([f32(1,:) f32t(1,:)]) + step;
y_min = min([f32(2,:) f32t(2,:)]) - step;
y_max = max([f32(2,:) f32t(2,:)]) + step;

x = x_min:step:x_max;
y = y_min:step:y_max;


[boundaries32] = MICD(m32,S32,x,y);

figure(3);
hold on;
title('MICD decision boundary for blocks 32x32')
xlabel('feature 1')
ylabel('feature 2')
contourf(x,y,boundaries32','Color', 'black');
colorbar
for i =1:10 
    pts = f32(1:2,(16*(i-1)+1):(16*i));
    scat_pts = scatter(pts(1,:), pts(2,:),30,'*');
end
legend("boundary",'Location','northwest')
hold off;

conf_matrix32 = MICD_conf_matrix(m32,S32,f32t);
disp("confusion matrix for blocks 32x32");
disp(conf_matrix32);


%% image multim
figure(4)
hold on
title('Composed image of multiple different textures')
xlabel('feature 1')
ylabel('feature 2')
imagesc(multim);
colorbar
axis equal
axis tight
hold off

%% MICD for image multim
res = MICD_Classify_image(m8,S8,multf8);

figure(5)
hold on
title('MICD for composed image of multiple different textures')
xlabel('feature 1')
ylabel('feature 2')
imagesc(res);
colorbar
axis equal
axis tight
hold off
%% K means for blocks 32x32

for k =1:2
[classes,prot] = K_means_fuzzy(f32,10,1);
figure(6+(k-1))
hold on;
title('K means for blocks 32x32')
xlabel('feature 1')
ylabel('feature 2')
CM = turbo(10);
Legend=cell(20,1);
for i =1:10 
    pts = classes(1:2,classes(3,:)==i);
    scat_pts = scatter(pts(1,:), pts(2,:),50,MarkerFaceColor=CM(i,:),marker='square');
    scatter(prot(1,i),prot(2,i),80,MarkerFaceColor=CM(i,:),MarkerEdgeColor="k", Marker ="hexagram");
     Legend{2*i-1}=strcat("class ", num2str(i));
    Legend{2*i}=strcat("prototype ", num2str(i));
end
legend(Legend,'Location','northwest');
hold off;
end

%% fuzzy K means for blocks 32x32

for k =1:2
[classes,prot] = K_means_fuzzy(f32,10,2);
figure(8+(k-1))
hold on;
title('fuzzy K means for blocks 32x32')
xlabel('feature 1')
ylabel('feature 2')
CM = turbo(10);
Legend=cell(20,1);
for i =1:10 
    pts = classes(1:2,classes(3,:)==i);
    scat_pts = scatter(pts(1,:), pts(2,:),50,MarkerFaceColor=CM(i,:),marker='square');
    scatter(prot(1,i),prot(2,i),80,MarkerFaceColor=CM(i,:),MarkerEdgeColor="k", Marker ="hexagram");
    Legend{2*i-1}=strcat("class ", num2str(i));
    Legend{2*i}=strcat("prototype ", num2str(i));
end
legend(Legend ,'Location','northwest');
hold off;
end


%% f2 as labeled data


figure(10)

hold on;
title('labeled blocks 2x2')
xlabel('feature 1')
ylabel('feature 2')
CM = turbo(10);
Legend=cell(10,1);
for i =1:10 
    pts = f2(1:2,(16*(i-1)+1):(16*i));
    scat_pts = scatter(pts(1,:), pts(2,:),50,MarkerFaceColor=CM(i,:),marker='square');
    Legend{i}=strcat("class ", num2str(i));
end
legend(Legend,'Location','northwest');
hold off;

%% f8 as labeled data


figure(11)

hold on;
title('labeled blocks 8x8')
xlabel('feature 1')
ylabel('feature 2')
CM = turbo(10);
Legend=cell(10,1);
for i =1:10 
    pts = f8(1:2,(16*(i-1)+1):(16*i));
    scat_pts = scatter(pts(1,:), pts(2,:),50,MarkerFaceColor=CM(i,:),marker='square');
    Legend{i}=strcat("class ", num2str(i));
end
legend(Legend,'Location','northwest');
hold off;
%% f32 as labeled data

figure(12)

hold on;
title('labeled blocks 32x32')
xlabel('feature 1')
ylabel('feature 2')
CM = turbo(10);
Legend=cell(10,1);
for i =1:10 
    pts = f32(1:2,(16*(i-1)+1):(16*i));
    scat_pts = scatter(pts(1,:), pts(2,:),50,MarkerFaceColor=CM(i,:),marker='square');
    Legend{i}=strcat("class ", num2str(i));
end
legend(Legend,'Location','northwest');
hold off;