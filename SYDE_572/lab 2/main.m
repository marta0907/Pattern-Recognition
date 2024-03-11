clear;
close all;
rng('default')
addpath("./Sequential_classifier/","./1D_estimators/","./2D_estimators/","./data/","./Classifiers/","./Standart PDFs/", "./scripts for plots/");
initial_data;

class_a_estimations;
class_b_estimations;
estimations_2d;
plot_sequential_classifier;
plot_errors;
