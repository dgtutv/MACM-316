function w = baryweights(x)
% 
% Description

n=length(x);
w=zeros(n,1);
for i=1:n 
    X=x-x(i)*ones(n,1);
    X=X([1:i-1 i+1:n],1);
    w(i)=1/prod(X);
end
