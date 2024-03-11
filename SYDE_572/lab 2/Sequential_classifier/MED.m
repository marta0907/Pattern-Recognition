function res = MED(x,mu_a,mu_b)
a = MED_dist(mu_a,x(1),x(2));
b = MED_dist(mu_b,x(1),x(2));
if a < b 
    res = 1;
else
    res = 2;
end
end