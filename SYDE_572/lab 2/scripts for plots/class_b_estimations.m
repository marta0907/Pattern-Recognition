max_b  = max(b);
x = 0:0.01:(max_b+1);
true_p_ex = ExponentialPDF(x,lambda);
%% Gaussian

[nu_est,sigma_est] = Gaussian_estimation_1D(b);
estimated_gauss = NormalPDF(x,nu_est,sigma_est);

y = zeros(size(b));
figure(6);
hold on;
grid on;
scatter(b,y);
plot(x,true_p_ex,'g',LineWidth=1);
plot(x,estimated_gauss,'b',LineWidth=1);
strmu = ['\mu_{est}=', num2str(nu_est)];
strsd = ['\sigma_{est}=', num2str(sigma_est)];
text(5.5, 0.8, strmu, 'HorizontalAlignment', 'center');
text(5.5, 0.75, strsd, 'HorizontalAlignment', 'center');

title('Gaussian Estimation')
legend("class b", "True p(x)","Estimated p(x)", 'Interpreter','latex');
xlabel('x')
ylabel('p(x)')
hold off;

%% Exponential

[lambda_est] = Exponential_estimation_1D(b);
estimated_exp = ExponentialPDF(x,1/lambda_est);

figure(7);
hold on;
grid on;
scatter(b,y);
plot(x,true_p_ex,'g',LineWidth = 1);
plot(x,estimated_exp,'b',LineWidth = 1);
strlambda = ['\lambda_{est}=', num2str(lambda_est)];
text(5.5, 0.8, strlambda, 'HorizontalAlignment', 'center');

title('Exponential Estimation')
legend("class b", "True p(x)","Estimated p(x)", 'Interpreter','latex');
xlabel('x')
ylabel('p(x)')
hold off;

%% Uniform

[a_est,b_est] = Uniform_estimation_1D(b);
estimated_unif = UniformPDF(x,a_est,b_est);

figure(8);
hold on;
grid on;
scatter(b,y);
plot(x,true_p_ex,'g',LineWidth = 1);
plot(x,estimated_unif,'b',LineWidth = 1);
stra = ['a_{est}=', num2str(a_est)];
strb = ['b_{est}=', num2str(b_est)];
text(5.5, 0.8, stra, 'HorizontalAlignment', 'center');
text(5.5, 0.75, strb, 'HorizontalAlignment', 'center');

title('Uniform Estimation')
legend("class b", "True p(x)","Estimated p(x)", 'Interpreter','latex');
xlabel('x')
ylabel('p(x)')

hold off;

%% Parzen

%h=0.1
[a_est_1] = Parzen_estimation_1D(b,0.1);
figure(9);
hold on;
grid on;
scatter(b,y);
plot(x,a_est_1,'b',LineWidth = 1);
plot(x,true_p_ex,'g',LineWidth = 1);
strh = ['h=', num2str(0.1)];
text(5.5, 0.8, strh, 'HorizontalAlignment', 'center');
title('Parzen Windows Estimation')
legend("class b","Estimated p(x)", "True p(x)", 'Interpreter','latex');
xlabel('x')
ylabel('p(x)')
hold off;

%h=0.4
[a_est_2] = Parzen_estimation_1D(b,0.4);
figure(10);
hold on;
grid on;
scatter(b,y);
plot(x,a_est_2,'b',LineWidth = 1);
plot(x,true_p_ex,'g',LineWidth = 1);
strh = ['h=', num2str(0.4)];
text(5.5, 0.8, strh, 'HorizontalAlignment', 'center');
title('Parzen Windows Estimation')
legend("class b","Estimated p(x)", "True p(x)", 'Interpreter','latex');
xlabel('x')
ylabel('p(x)')
hold off;