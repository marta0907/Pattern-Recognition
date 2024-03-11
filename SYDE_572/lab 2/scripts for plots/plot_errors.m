[min_er, max_er, avarage_er, stdev_er] = Error_Rate_of_sequential_classifier(a,b,J,limit);

figure(16);
hold on;
grid on;
plot(min_er);
title('Min')
xlabel('J')
ylabel('rate')
legend("min of error", 'Interpreter','none');
hold off;

figure(17);
hold on;
grid on;
plot(max_er);
title('Max')
xlabel('J')
ylabel('rate')
legend("max of error", 'Interpreter','none');
hold off;

figure(18);
hold on;
grid on;
plot(avarage_er);
title('Mean')
xlabel('J')
ylabel('rate')
legend("mean of error", 'Interpreter','none');
hold off;

figure(19);
hold on;
grid on;
plot(stdev_er);
title('Standard Deviation')
xlabel('J')
ylabel('rate')
legend("stdv of error", 'Interpreter','none');
hold off;