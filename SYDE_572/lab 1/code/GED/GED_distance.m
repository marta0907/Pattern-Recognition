function [dist] = GED_distance(z, x, Phi, Lambda) % Z - prototype X - dot to classify 
Lambda_1 = inv(Lambda);
dist = (x-z)'*Phi*Lambda_1*Phi'*(x-z);
end