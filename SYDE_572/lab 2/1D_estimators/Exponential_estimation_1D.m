function[lambda_est] = Exponential_estimation_1D(data)
num = length(data);
overall = sum(data);
lambda_est = num/overall;
end