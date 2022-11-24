%-----------------Define our mathematical functions-----------------------%
syms q(t) p(t)
Dq = diff(q) == p;
Dp = diff(p) == -q/(diff(q, t).^2 + diff(q,t,2).^2).^(3/2);
Q = [diff(q,t); diff(q,t,2)];       %q(t) = [q1(t); q2(t)]
P = [diff(p,t); diff(p,t,2)];       %p(t) = [p1(t); p2(t)]


%------------------------------Part 1-------------------------------------%
e = 0.6;
N = 200;
%Initial values
q1 = zeros(N,1);
q2 = zeros(N,1);
p1 = zeros(N,1);
p2 = zeros(N,1);
q1(1) = 1-e;
q2(1) = 0;
p1(1) = 0;
p2(1) = sqrt((1+e)/(1-e));
%Mesh
mesh = a:h:b;
%Euler steps
for i=1:N-1
    q1(i+1) = q1(i) + h*p1(i);
    q2(i+1) = q2(i) + h*p2(i);
    p1(i+1) = p1(i) + h*;
    p2(i+1) = p2(i) + h*Dp(p2(i));
end
