function y = NormalPDF(x,mu,sigma)
y = zeros(length(x));
    for i=1:length(x)
        y(i) =exp((-((x(i)-mu).^2)) /(2*sigma^2))/(sigma*sqrt(2*pi));
    end
end