
%% MED GED MAP plot for classes A and B
figure(13);
hold on;
title('MED GED MAP plot for classes A and B');


y = min_x_ab-1:0.05:max_x_ab+1;
x = min_y_ab-1:0.05:max_y_ab+1;

Z1 = MAP(nu_a,nu_b,matrix_a,matrix_b,prob_A,prob_B,x,y);
Z2 = MED(nu_a,nu_b,x,y,1,2);
Z3 = GED(nu_a,nu_b,eigvec_a,eigvec_b,eigval_a,eigval_b,1,2,x,y);


[C2,h] = contour(y, x, Z2,1, 'g*');
h.LineWidth = 2 ;
[C3,h] = contour(y, x, Z3,1, 'b');
h.LineWidth = 2 ;
[C1,h] = contour(y, x, Z1,1, 'm--');
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

%% MED GED MAP  plot for classes C and D and E
figure(14);
hold on;
title('MED GED MAP  plot for classes C and D and E');


y = min_x_cde-1:0.05:max_x_cde+1;
x = min_y_cde-1:0.05:max_y_cde+1;

Z1 = MAP_3(nu_c,nu_d,nu_e,matrix_c,matrix_d,matrix_e,prob_C,prob_D,prob_E,x,y);
Z2 = MED_3(nu_c,nu_d,nu_e,x,y,1,2,3);
Z3 = GED_3(nu_c,nu_d,nu_e, ...
    eigvec_c,eigvec_d,eigvec_e, ...
    eigval_c,eigval_d,eigval_e, ...
    1,2,3, ...
    x,y);

for k=1:3
[C2,h] = contour(y, x, Z2 == k,1, 'g-');
h.LineWidth = 2 ;
[C3,h] = contour(y, x, Z3== k,1, 'b');
h.LineWidth = 2 ;
[C1,h] = contour(y, x, Z1== k,1, 'm--');
h.LineWidth = 2 ;
end

xlabel('x_1');
ylabel('x_2');

plot(nu_c(1),nu_c(2),'gs');
plot(nu_d(1),nu_d(2),'gs');
plot(nu_e(1),nu_e(2),'gs');

scat_samples_c = scatter(samples_c(:,1), samples_c(:,2),30,'b*');
scat_samples_d = scatter(samples_d(:,1), samples_d(:,2),30,'r+');
scat_samples_e = scatter(samples_e(:,1), samples_e(:,2),30,'k');

plot_ellipse(nu_c(1),nu_c(2),theta_c,sqrt(eigval_c(2,2)),sqrt(eigval_c(1,1)), 'blue');
plot_ellipse(nu_d(1),nu_d(2),theta_d,sqrt(eigval_d(2,2)),sqrt(eigval_d(1,1)), 'red');
plot_ellipse(nu_e(1),nu_e(2),theta_e,sqrt(eigval_e(2,2)),sqrt(eigval_e(1,1)), 'k');
legend([scat_samples_c, scat_samples_d, scat_samples_e], {'Class C', 'Class D', 'Class E'}, 'Location', 'northeast');

hold off;