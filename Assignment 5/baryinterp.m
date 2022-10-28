function u= baryinterp(x,w,y,grid)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

n=length(x);
m=length(grid);

u=zeros(m,1);

for i=1:m
    
    diff=grid(i).*ones(n,1)-x;
    l=sum(diff==0);
    
    %disp([num2str(diff)]);
    %disp(['l=' num2str(l)]);
    
    if l==0
       z=w./diff;
       u(i)=(z'*y)/sum(z);
    else
        u(i)=y(find(diff==0));
    end
    %disp(['u=' num2str(u(i))]);
end
    
    %Nsum=0;
    %Dsum=0;
    %for j=0:n
    %Nsum=Nsum+w(j)*y(j)    


end

