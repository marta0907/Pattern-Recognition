%% MAP for case 1
figure(7);
hold on;
title('MAP classifier of Class A and Class B');


y = min_x_ab-1:0.05:max_x_ab+1;
x = min_y_ab-1:0.05:max_y_ab+1;
prob_A = n_a /(n_a+n_b);
prob_B = n_b /(n_a+n_b);
Z = MAP(nu_a,nu_b,matrix_a,matrix_b,prob_A,prob_B,x,y);


imagesc(y, x, Z);
colormap("jet(5)");
[C,h] = contour(y, x, Z,1, 'g');
h.LineWidth = 2 ;

plot(nu_a(1),nu_a(2),'gs');
plot(nu_b(1),nu_b(2),'gs');

scat_samples_a = scatter(samples_a(:,1), samples_a(:,2),30,"b");
scat_samples_b = scatter(samples_b(:,1), samples_b(:,2), 30,"r");

xlabel('x_1');
ylabel('x_2');

plot_ellipse(nu_a(1),nu_a(2),theta_a,sqrt(eigval_a(2,2)),sqrt(eigval_a(1,1)), 'b ');
plot_ellipse(nu_b(1),nu_b(2),theta_b,sqrt(eigval_b(2,2)),sqrt(eigval_b(1,1)), 'r');
legend([scat_samples_a, scat_samples_b], {'Class A', 'Class B'}, 'Location', 'northeast');
hold off;

%% MAP for case 2

figure(8);
hold on;
title('MAP classifier of Class C, Class D and Class E');
xlabel('x_1');
ylabel('x_2');

y = min_x_cde-1:0.05:max_x_cde+1;
x = min_y_cde-1:0.05:max_y_cde+1;
prob_C = n_c/(n_c+n_d+n_e);   
prob_D = n_d/(n_c+n_d+n_e);   
prob_E = n_e/(n_c+n_d+n_e);   

Z = MAP_3(nu_c,nu_d,nu_e,matrix_c,matrix_d,matrix_e,prob_C,prob_D,prob_E,x,y);

imagesc(y, x, Z);
colormap("turbo(4)");
for k=1:3
[b,h] = contour(y, x, Z == k, 1,'g');
h.LineWidth = 2;
end

scat_samples_c = scatter(samples_c(:,1), samples_c(:,2),30,'b*');
scat_samples_d = scatter(samples_d(:,1), samples_d(:,2),30,'r+');
scat_samples_e = scatter(samples_e(:,1), samples_e(:,2),30,'y');


plot_ellipse(nu_c(1),nu_c(2),theta_c,sqrt(eigval_c(2,2)),sqrt(eigval_c(1,1)), 'blue');
plot_ellipse(nu_d(1),nu_d(2),theta_d,sqrt(eigval_d(2,2)),sqrt(eigval_d(1,1)), 'red');
plot_ellipse(nu_e(1),nu_e(2),theta_e,sqrt(eigval_e(2,2)),sqrt(eigval_e(1,1)), '#EDB120');

plot(nu_c(1),nu_c(2),'gs');
plot(nu_d(1),nu_d(2),'gs');
plot(nu_e(1),nu_e(2),'gs');
legend([scat_samples_c, scat_samples_d, scat_samples_e], {'Class C', 'Class D', 'Class E'}, 'Location', 'northeast');

hold off;
