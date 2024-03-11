load('lab2_3.mat');

% MED classification meshgrid
min_x = min(min(a(:,1)),min(b(:,1)));
min_y = min(min(a(:,2)),min(b(:,2)));
max_x = max(max(a(:,1)),max(b(:,1)));
max_y = max(max(a(:,2)),max(b(:,2)));

x = min_x:1:max_x;
y = min_y:1:max_y;
for i=1:3
[G, n_ab, n_ba] = Sequential_Discriminant(a,b,0);

Z = Classify_Sequentially(x,y,G,n_ab, n_ba);

figure(12+i);
hold on;
colormap("turbo(4)");

contourf(x, y, Z, 'Color', 'black');

scat_samples_a = scatter(a(:,1), a(:,2),30,'c*');
scat_samples_b = scatter(b(:,1), b(:,2),30,'m+');
title('Sequential classification')
legend('boundary','class a', 'class b')
xlabel('x')
ylabel('y')
hold off;
end