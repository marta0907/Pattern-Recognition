function y = UniformPDF(x,a,b)
y = zeros(length(x));
value= 1/(b-a);
for i=1:length(x)
    if x(i) >=a && x(i)<=b
        y(i) =value;
    else
        y(i)=0;
    end
end
end