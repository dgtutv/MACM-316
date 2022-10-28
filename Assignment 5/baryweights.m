function w = baryweights(x)
    n=length(x);
    w=zeros(n,1);
    for i=1:n
        X=x-x(i);
        X=X([1:i-1 i+1:n]);
        w(i)=1/prod(X);
    end
end
