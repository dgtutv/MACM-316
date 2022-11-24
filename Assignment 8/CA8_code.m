%------------------------------Part 1-------------------------------------%
e = 0.6;
h = 0.0005;
N = 200/h;
%Initial values
q1 = zeros(1,N);
q2 = zeros(1,N);
p1 = zeros(1,N);
p2 = zeros(1,N);
q1(1) = 1-e;
q2(1) = 0;
p1(1) = 0;
p2(1) = sqrt((1+e)/(1-e));

q = [q1; q2];
p = [p1; p2];
%Mesh
mesh = 0:0.0005:200;
%Euler steps
for i=1:N-1
    q(i+1) = q(i) + h*p(i);
    p(i+1) = p(i) - h*q(i)/((q(1,i).^2 + q(1,i).^2).^(3/2));
end
