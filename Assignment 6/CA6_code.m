n = 5;
for i=1:n
    b=fzero(@(x) x*exp(x)-i*pi,0);
    a(i)=exp(-b);
end
Q = zeros();
for i=1:length(a)
    %Compute integral woth numerical quadrature
    I = integral(f(x), a(i), x(i+1));
    %Compute Q(n) sum
    Q(n) = Q(n) + I;
end

function y = f(x)
    y = (x^-1)*sin((x^-1)*log(x));
end