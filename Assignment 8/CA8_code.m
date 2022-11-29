%------------------------------Part 1-------------------------------------%

%Initial values & Solve
h = 0.0005;
e = 0.6;
y = [1-e, 0; 0, sqrt(((1+e)/(1-e)))];
f = @(t, y) [y(2,:); -y(1,:)/((y(1,1).^2 + y(1,2).^2).^(3/2))];
[q, p] = Euler(y, f, 0.0005, 0, 200);   
q1 = q(:,1);
q2 = q(:,2);
p1 = p(:,1);
p2 = p(:,2);

%Plot in q1-q2 plane
close all;
hold on;
grid on;
axis on;
title("Approximate position of the planet at time tn");
xlabel("q1(t)");
ylabel("q2(t)")
plot(q1, q2);
hold off;

%------------------------------Part 2-------------------------------------%

%Compute angular momentum A(t) and Hamiltonian H(t)
A = q1*p2 - q2*p1;
H = 0.5*(p1^2 + p2^2) - 1/sqrt(q1^2 + q2^2);

%Plot in q1-q2 plane
disp(A);
disp(H);

%---------------------------Eulers Method---------------------------------%
function [q, p] = Euler(y, f, h, a, b)
    N = (b-a)/h;
    t = a;
    for i = 2:N
        y = y + h*f(t, y);
        t = t + h;
        %Seperate q and p for easier understanding of whats happening
        q(i, :) = y(1, :);
        p(i, :) = y(2, :);
    end
end