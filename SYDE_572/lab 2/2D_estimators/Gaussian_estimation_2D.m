function[nu_est,cov_est] = Gaussian_estimation_2D(data)
num = length(data);
nu_est = sum(data)/num;
cov_est=cov(data);
end