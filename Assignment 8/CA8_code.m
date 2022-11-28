%------------------------------Part 1-------------------------------------%

%Initial values & Solve
h = 0.0005;
q = [1-0.6; 0];
p = [0, sqrt(((1+0.6)/(1-0.6)))];
dq = @(t, p, q) p;
dp = @(t, p, q) -1/(q(1).^2 +q(2).^2).^(3/2) * q;
[Q1, P1] = Euler(dq, dp, q, p, 0.0005, 0, 200);   

%use their method for X, use wq, and wp tho

%Plot in q1-q2 plane
plot(Q1(1), Q1(2));

%---------------------------Eulers Method---------------------------------%
function [Q,P] = Euler(dq, dp, q, p, h, a, b)
    N = (b-a)/h;
    t = [a];
    Q = [q];
    P = [p];
    for i = 2:N
        disp(p + dp(t,p,q) *h);
        Q(i, :) = q + dq(t,p,q) * h;
        P (i, :) = p + dp(t,p,q) *h;
    end
end