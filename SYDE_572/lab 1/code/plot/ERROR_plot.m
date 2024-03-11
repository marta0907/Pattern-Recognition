rng(10);
test_a = generate_cluster(n_a, nu_a, matrix_a);
test_b = generate_cluster(n_b, nu_b, matrix_b);
test_c = generate_cluster(n_c, nu_c, matrix_c);
test_d = generate_cluster(n_d, nu_d, matrix_d);
test_e = generate_cluster(n_e, nu_e, matrix_e);


[m,e] = MED_error_2(test_a,test_b, nu_a,nu_b);

disp("MED Error analysis for classes A and B");
disp(e);
disp(m);

[m1,e1] = MED_error_3(test_c,test_d,test_e, nu_c,nu_d,nu_e);
disp("MED Error analysis for classes C, D and E");
disp(e1);
disp(m1);

[m2,e2] = GED_error_2(test_a,test_b, ...
    nu_a,nu_b, ...
    eigvec_a,eigvec_b, ...
    eigval_a,eigval_b);

disp("GED Error analysis for classes A and B");
disp(e2);
disp(m2);


[m3,e3] = GED_error_3(test_c,test_d,test_e, ...
    nu_c,nu_d,nu_e, ...
    eigvec_c,eigvec_d,eigvec_e, ...
    eigval_c,eigval_d,eigval_e);

disp("GED Error analysis for classes C, D and E");
disp(e3);
disp(m3);

[m4,e4] = MAP_error_2(test_a,test_b, ...
    nu_a,nu_b, ...
    matrix_a,matrix_b, ...
    prob_A,prob_B);
disp("MAP Error analysis for classes A and B");
disp(e4);
disp(m4);

[m5,e5] = MAP_error_3(test_c,test_d,test_e, ...
    nu_c,nu_d,nu_e, ...
   matrix_c,matrix_d ,matrix_e, ...
   prob_C,prob_D,prob_E);
disp("MAP Error analysis for classes C, D and E");
disp(e5);
disp(m5);


[m6,e6] = KNN_error_2(1,samples_a,samples_b,test_a,test_b);
disp("NN Error analysis for classes A and B");
disp(e6);
disp(m6);

[m7,e7] = KNN_error_3(1,samples_c,samples_d,samples_e,test_c,test_d,test_e);
disp("NN Error analysis for classes C, D and E");
disp(e7);
disp(m7);

[m8,e8] = KNN_error_2(5,samples_a,samples_b,test_a,test_b);

disp("5NN Error analysis for classes A and B");
disp(e8);
disp(m8);

[m9,e9] = KNN_error_3(5,samples_c,samples_d,samples_e,test_c,test_d,test_e);
disp("5NN Error analysis for classes C, D and E");
disp(e9);
disp(m9);