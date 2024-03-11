function gen_cluster = generate_cluster(n, nu, covar)
diag = chol(covar);
gen_cluster = repmat(nu, n, 1) + randn(n, 2)*diag;
end