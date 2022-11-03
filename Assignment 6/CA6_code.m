n = 5;
for i=1:n
    b=fzero(@(x) x*exp(x)-i*pi,0);
    a(i)=exp(-b);
end
