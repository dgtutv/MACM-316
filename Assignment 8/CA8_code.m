%-----------------Define our mathematical functions------------------------
syms q(t) p(t)
q = @(t) [q1(t); q2(t)];
p = @(t) [p1(t); p2(t)];
Dq = @(t) p(t);
Dp = @(t) -q(t)/(q1(t).^2 + q2(t).^2).^(3/2);

%Part 1
e = 0.6;
N = 200/0.0005;
%Initial values
q1 = zeros(N,1);
q2 = zeros(N,1);
p1 = zeros(N,1);
p2 = zeros(N,1);
q1(1) = 1-e;
q2(1) = 0;
p1(1) = 0;
p2(1) = sqrt((1+e)/(1-e));
[mesh, q1, q2, p1, p2] = Euler(N, 0, 200, 0.0005, q1, q2, p1, p2, Dq, Dp);

%------------------Define our algorithmic functions------------------------

%Euler's method, adapted from Euler1.m
function [mesh, q1, q2, p1, p2] = Euler(N, a, b, h, q1, q2, p1, p2, Dq, Dp)
    %Mesh
    mesh = a:h:b;
    %Euler steps
    for i=1:N-1
        q1(i+1) = q1(i) + h*q2(i);
        q2(i+1) = q2(i) + h*Dq(q2(i));
        p1(i+1) = p1(i) + h*p1(i);
        p2(i+1) = p2(i) + h*Dp(p2(i));
    end
end
