%------------------------------Part 1-------------------------------------%
e = 0.6;
h = 0.0005;
N = 200/h;
%Initial values
part1 = Euler(p, -1/(q(1).^2 +q(2).^2).^(3/2) * q, [1-0.6; 0], [0, sqrt(((1+0.6)/(1-0.6)))]);

%Eulers method
function output = Euler(dq, dp, q, p, h, N)
    for i = 2:N
        q(i) = q + dq * h;
        p (i) = p + dp *h;
    end
end