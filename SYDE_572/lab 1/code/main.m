%% Remove any variables and close all plots
clear;
close all;

% Set the random state for consistency
rng('default')
addpath('./helper_functions/', './MAP','./GED/','./MED/','./KNN/','./Error analysis/','./plot/');

%% Create the samples for each class
initialData;

samples_a = generate_cluster(n_a, nu_a, matrix_a);
samples_b = generate_cluster(n_b, nu_b, matrix_b);
samples_c = generate_cluster(n_c, nu_c, matrix_c);
samples_d = generate_cluster(n_d, nu_d, matrix_d);
samples_e = generate_cluster(n_e, nu_e, matrix_e);

[min_x_ab, min_y_ab] = GlobalMin(samples_a,samples_b);
[max_x_ab, max_y_ab] = GlobalMax(samples_a,samples_b);
[min_x_cde, min_y_cde] = GlobalMin3(samples_c,samples_d,samples_e);
[max_x_cde, max_y_cde] = GlobalMax3(samples_c,samples_d,samples_e);


%{
Samples_plot;
MED_plot;
GED_plot;
MAP_plot;
NN_plot;
NN5_plot;
MED_GED_MAP_plot;
NN_5NN_plot;
%}
ERROR_plot;
