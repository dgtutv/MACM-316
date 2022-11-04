Q = [];
f = @(x) (x.^-1).*sin((x.^-1).*log(x));
for n=100:100:1000
    Q(n/100) = 0;
    for i=1:n
        b=fzero(@(x) x*exp(x)-i*pi,0);
        a(i)=exp(-b);
        if i~=1
            %Compute integral with numerical quadrature
            I = integral(f, a(i-1), a(i));
            %Compute Q(n) sum
            Q(n/100) = Q(n/100) + I; 
        end
    end
end
format longg
%How many digits of I can you accurately compute?
disp(Q)
