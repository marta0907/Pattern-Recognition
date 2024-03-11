%% plot for case 1

figure(1);
hold on;
title('Plotting of Samples of Class A and Class B');

scat_samples_a = scatter(samples_a(:,1), samples_a(:,2),25,"m");
scat_samples_b = scatter(samples_b(:,1), samples_b(:,2), 25,"b");
xlabel('x_1');
ylabel('x_2');

plot(nu_a(1),nu_a(2),'gs');
plot(nu_b(1),nu_b(2),'gs');

% Plotting the unit std dev ellipse for each class
plot_ellipse(nu_a(1),nu_a(2),theta_a,sqrt(eigval_a(2,2)),sqrt(eigval_a(1,1)), 'm');
plot_ellipse(nu_b(1),nu_b(2),theta_b,sqrt(eigval_b(2,2)),sqrt(eigval_b(1,1)), 'b');

legend([scat_samples_a, scat_samples_b], {'Class A', 'Class B'}, 'Location', 'northeast');
hold off;


%% plot case 2

figure(2);
hold on;
title('Plotting of Samples of Class C, Class D and Class E');
scat_samples_c = scatter(samples_c(:,1), samples_c(:,2));
scat_samples_d = scatter(samples_d(:,1), samples_d(:,2));
scat_samples_e = scatter(samples_e(:,1), samples_e(:,2));

% Plotting the unit std dev ellipse for each class
plot_ellipse(nu_c(1),nu_c(2),theta_c,sqrt(eigval_c(2,2)),sqrt(eigval_c(1,1)), 'blue');
plot_ellipse(nu_d(1),nu_d(2),theta_d,sqrt(eigval_d(2,2)),sqrt(eigval_d(1,1)), 'red');
plot_ellipse(nu_e(1),nu_e(2),theta_e,sqrt(eigval_e(2,2)),sqrt(eigval_e(1,1)), '#EDB120');
plot(nu_c(1),nu_c(2),'gs');
plot(nu_d(1),nu_d(2),'gs');
plot(nu_e(1),nu_e(2),'gs');
xlabel('x_1');
ylabel('x_2');
legend([scat_samples_c, scat_samples_d, scat_samples_e], {'Class C', 'Class D', 'Class E'}, 'Location', 'northeast');

hold off;
