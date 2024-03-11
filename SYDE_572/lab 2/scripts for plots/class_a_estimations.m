load("data/lab2_1.mat");

max_a  = max(a);
x = 0:0.01:(max_a+1);
true_p_norm = NormalPDF(x,nu,sigma);
%% Gaussian

[nu_est,sigma_est] = Gaussian_estimation_1D(a);
estimated_gauss = NormalPDF(x,nu_est,sigma_est);

y = zeros(size(b));
figure(1);
hold on;
grid on;
scatter(a,y);
plot(x,true_p_norm,'g',LineWidth=1);
plot(x,estimated_gauss,'b',LineWidth=1);
strmu = ['\mu_{est}=', num2str(nu_est)];
strsd = ['\sigma_{est}=', num2str(sigma_est)];
text(9.0, 0.33, strmu, 'HorizontalAlignment', 'center');
text(9.0, 0.30, strsd, 'HorizontalAlignment', 'center');

title('Gaussian Estimation')
legend("class a", "True p(x)", "Estimated p(x)", 'Interpreter','latex');
xlabel('x')
ylabel('p(x)')
hold off;


%% Exponential

[lambda_est] = Exponential_estimation_1D(a);
estimated_exp = exppdf(x,1/lambda_est);

figure(2);
hold on;
grid on;
scatter(a,y);
plot(x,true_p_norm,'g',LineWidth = 1);
plot(x,estimated_exp,'b',LineWidth = 1);
strlambda = ['\lambda_{est}=', num2str(lambda_est)];
text(9.0, 0.33, strlambda, 'HorizontalAlignment', 'center');

title('Exponential Estimation')
legend("class a", "True p(x)","Estimated p(x)", 'Interpreter','latex');
xlabel('x')
ylabel('p(x)')
hold off;

%% Uniform

[a_est,b_est] = Uniform_estimation_1D(a);
estimated_unif = UniformPDF(x,a_est,b_est);

figure(3);
hold on;
grid on;
scatter(a,y);
plot(x,true_p_norm,'g',LineWidth = 1);
plot(x,estimated_unif,'b',LineWidth = 1);
stra = ['a_{est}=', num2str(a_est)];
strb = ['b_{est}=', num2str(b_est)];
text(9.0, 0.33, stra, 'HorizontalAlignment', 'center');
text(9.0, 0.3, strb, 'HorizontalAlignment', 'center');

title('Uniform Estimation')
legend("class a", "True p(x)","Estimated p(x)", 'Interpreter','latex');
xlabel('x')
ylabel('p(x)')

hold off;

%% Parzen

%h=0.1
[a_est_1] = Parzen_estimation_1D(a,0.1);
figure(4);
hold on;
grid on;
scatter(a,y);
plot(x,a_est_1,'b',LineWidth = 1);
plot(x,true_p_norm,'g',LineWidth = 1);
strh = ['h=', num2str(0.1)];
text(9.0, 0.55, strh, 'HorizontalAlignment', 'center');
title('Parzen Windows Estimation')
legend("class a","Estimated p(x)", "True p(x)", 'Interpreter','latex');
xlabel('x')
ylabel('p(x)')
hold off;

%h=0.4
[a_est_2] = Parzen_estimation_1D(a,0.4);
figure(5);
hold on;
grid on;
scatter(a,y);
plot(x,a_est_2,'b',LineWidth = 1);
plot(x,true_p_norm,'g',LineWidth = 1);
strh = ['h=', num2str(0.4)];
text(9.0, 0.33, strh, 'HorizontalAlignment', 'center');
title('Parzen Windows Estimation')
legend("class a","Estimated p(x)", "True p(x)", 'Interpreter','latex');
xlabel('x')
ylabel('p(x)')
hold off;


