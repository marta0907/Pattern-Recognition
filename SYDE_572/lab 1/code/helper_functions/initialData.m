% !Case 1
n_a = 200; 
nu_a = [5, 10];
matrix_a = [8, 0; 0, 4];

%eig - Eigenvalues and eigenvectors
%[V,D] = eig(A) returns diagonal matrix D of eigenvalues and matrix V whose
% columns are the corresponding right eigenvectors, so that A*V = V*D
[eigvec_a, eigval_a] = eig(matrix_a); 
theta_a = atan(eigvec_a(2,2)/eigvec_a(2,1));


n_b = 200; 
nu_b = [10, 15];
matrix_b = [8, 0; 0, 4];
[eigvec_b, eigval_b] = eig(matrix_b); 
theta_b = atan(eigvec_b(2,2)/eigvec_b(2,1));



% !Case 2
n_c = 100; 
nu_c = [5, 10];
matrix_c = [8, 4; 4, 40];
[eigvec_c, eigval_c] = eig(matrix_c);
theta_c = atan(eigvec_c(2,2)/eigvec_c(2,1));

n_d = 200; 
nu_d = [15, 10];
matrix_d = [8, 0; 0, 8];
[eigvec_d, eigval_d] = eig(matrix_d);
theta_d = atan(eigvec_d(2,2)/eigvec_d(2,1));

n_e = 150; 
nu_e = [10, 5];
matrix_e = [10, -5; -5, 20];
[eigvec_e, eigval_e] = eig(matrix_e);
theta_e = atan(eigvec_e(2,2)/eigvec_e(2,1));




prob_A = n_a /(n_a+n_b);
prob_B = n_b /(n_a+n_b);
prob_C = n_c/(n_c+n_d+n_e);   
prob_D = n_d/(n_c+n_d+n_e);   
prob_E = n_e/(n_c+n_d+n_e);   