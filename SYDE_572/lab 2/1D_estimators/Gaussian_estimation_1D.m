function [nu_est, sigma_est] = Gaussian_estimation_1D(data)
num = length(data);
nu_est = sum(data)/num;
sigma_est = sqrt(sum((data-nu_est).^2)/num);
end