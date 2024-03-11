function y = ExponentialPDF(x,lambda)
y = zeros(length(x));
    for i =1:length(x)
        y(i) = lambda*exp(-lambda*x(i));
    end
end