Q = [];
f = @(x) (x.^-1).*sin((x.^-1).*log(x));
for n=100:100:1000
    for i=1:n
        b=fzero(@(x) x*exp(x)-i*pi,0);
        a(i)=exp(-b);
    end
    Q(n/100) = 0;
    for i=1:(n-1)
        %Compute integral with numerical quadrature
        I = integral(f, a(i), a(i+1));
        %Compute Q(n) sum
        Q(n/100) = Q(n/100) + I;
    end
end
