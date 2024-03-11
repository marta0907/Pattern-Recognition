function [res] = ML_calc(z_a,z_b,x,cov_a,cov_b)
cov_a_1 = inv(cov_a);
cov_b_1 = inv(cov_b);

det_a = cov_a(1,1)*cov_a(2,2)-cov_a(1,2)*cov_a(2,1);
det_b = cov_b(1,1)*cov_b(2,2)-cov_b(1,2)*cov_b(2,1);

left = (x-z_b)*cov_b_1*(x-z_b)'- (x-z_a)*cov_a_1*(x-z_a)';
right =log(det_a/det_b);

res = left - right;
end