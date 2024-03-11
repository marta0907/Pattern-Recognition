load("./data/lab2_2.mat");

min_al_x = min(al(:,1));
min_al_y = min(al(:,2));

min_bl_x = min(bl(:,1));
min_bl_y = min(bl(:,2));

min_cl_x = min(cl(:,1));
min_cl_y = min(cl(:,2));

max_al_x = max(al(:,1));
max_al_y = max(al(:,2));

max_bl_x = max(bl(:,1));
max_bl_y = max(bl(:,2));

max_cl_x = max(cl(:,1));
max_cl_y = max(cl(:,2));


min_x = min(min(min_al_x,min_bl_x),min_cl_x)-1;
min_y = min(min(min_al_y,min_bl_y),min_cl_y)-1;

max_x = max(max(max_al_x,max_bl_x),max_cl_x)+1;
max_y = max(max(max_al_y,max_bl_y),max_cl_y)+1;

x = min_x:1:max_x;
y = min_y:1:max_y;

%% Gaussian

[nu_a,cov_a] = Gaussian_estimation_2D(al);
[nu_b,cov_b] = Gaussian_estimation_2D(bl);
[nu_c,cov_c] = Gaussian_estimation_2D(cl);

disp("class al");
disp(nu_a);
disp(cov_a);
disp("class bl");
disp(nu_b);
disp(cov_b);
disp("class cl");
disp(nu_c);
disp(cov_c);


Z = ML_classifier(nu_a,nu_b,nu_c,cov_a,cov_b,cov_c,x,y);

figure(11);
hold on;
colormap("turbo(4)");

contourf(y, x, Z, 'Color', 'black');

scat_samples_c = scatter(at(:,1), at(:,2),30,'b*');
scat_samples_d = scatter(bt(:,1), bt(:,2),30,'r+');
scat_samples_e = scatter(ct(:,1), ct(:,2),30,'y');
legend([scat_samples_c, scat_samples_d, scat_samples_e], {'Class al', 'Class bl', 'Class cl'}, 'Location', 'northeast');

title('Parametric Estimation')
legend('boundary','al', 'bl', 'cl')
xlabel('x')
ylabel('y')
hold off;

%% parzen
h = sqrt(k);
n = 12;
resolution =0.5;

res = [resolution, min_x, min_y, max_x,max_y];

nc = round(n*h/resolution);
x = resolution.*(-nc:nc);
win = exp(-resolution.*x.*x/(h*h)) / (sqrt(2*pi)*h);

[result,x,y] = Parzen_2D(al,bl,cl,res,win);

figure(12)
hold on 
colormap("turbo(4)")

contourf(x, y, result, 'Color', 'black');

scat_samples_c = scatter(at(:,1), at(:,2),30,'b*');
scat_samples_d = scatter(bt(:,1), bt(:,2),30,'r+');
scat_samples_e = scatter(ct(:,1), ct(:,2),30,'y');
legend([scat_samples_c, scat_samples_d, scat_samples_e], {'Class al', 'Class bl', 'Class cl'}, 'Location', 'northeast');

title('Parzen Windows Estimation')
legend('boundary','al', 'bl', 'cl')
xlabel('x')
ylabel('y')
hold off