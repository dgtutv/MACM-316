%Initial values & Solve
h = 0.0005;
e = 0.6;
y = [1-e, 0; 0, sqrt(((1+e)/(1-e)))];
f = @(t, y) [y(2,:); -y(1,:)/((y(1,1).^2 + y(1,2).^2).^(3/2))];
[q, p, A, H] = Euler(y, f, 0.0005, 0, 200);       %Compute with regular Euler's Method
[qS, pS, AS, HS] = EulerS(y, 0.0005, 0, 200);     %Compute with sympletic Euler's Method
q1 = q(:,1);
q2 = q(:,2);
p1 = p(:,1);
p2 = p(:,2);

q1S = qS(:,1);
q2S = qS(:,2);
p1S = pS(:,1);
p2S = pS(:,2);

%-------------------------Regular Euler plots-----------------------------%

%Plot in q1-q2 plane
close all;
hold on;
grid on;
axis on;
title("Approximate position of the planet at time tn (standard Euler's)");
xlabel("q1(t)");
ylabel("q2(t)");
plot(q1, q2);
hold off;
figure;

%Plot A(t)
t = a:h:b;
hold on;
grid on;
axis on;
title("Angular momentum vs time (standard Euler's)");
xlabel("Time");
ylabel("Angular Momentum");
plot(t, A);
hold off;
figure;

%Plot H(t)
t = a:h:b;
hold on;
grid on;
axis on;
title("Hamiltonian vs time (standard Euler's)");
xlabel("Time");
ylabel("Hamiltonian");
plot(t, A);
hold off;
figure;

%-----------------------Symplectic Euler plots----------------------------%

%Plot in q1-q2 plane
hold on;
grid on;
axis on;
title("Approximate position of the planet at time tn (symplectic Euler's)");
xlabel("q1(t)");
ylabel("q2(t)");
plot(q1S, q2S);
hold off;
figure;

%Plot A(t)
hold on;
grid on;
axis on;
title("Angular momentum vs time (symplectic Euler's)");
xlabel("Time");
ylabel("Angular Momentum");
plot(t, AS);
hold off;
figure;

%Plot H(t)
t = a:h:b;
hold on;
grid on;
axis on;
title("Hamiltonian vs time (symplectic Euler's)");
xlabel("Time");
ylabel("Hamiltonian");
plot(tS, AS);
hold off;



%--------------------------Euler's Method---------------------------------%
function [q, p, A, H] = Euler(y, f, h, a, b)
    N = (b-a)/h;
    t = a;
    for i = 2:N
        y = y + h*f(t, y);
        t = t + h;
        %Seperate q and p for easier understanding of whats happening
        q(i, :) = y(1, :);
        p(i, :) = y(2, :);
        %Compute angular momentum A(t) and Hamiltonian H(t)
        q1 = q(:,1);
        q2 = q(:,2);
        p1 = p(:,1);
        p2 = p(:,2);
        A = q1.*p2 - q2.*p1;
        H = 0.5*(p1.^2 + p2.^2) - 1/sqrt(q1.^2 + q2.^2);
    end
end             

%----------------------Symplectic Euler's Method--------------------------%
function [q, p, A, H] = EulerS(y, h, a, b)
    N = (b-a)/h;
    q = y(1, :);
    p = y(2, :);
    for i = 2:N
        q(i, :) = q(i-1, :) + h.*p(i-1, :);
        p(i, :) = p(i-1, :) - (h.*q(i, :))/((q(i,1).^2 + q(i,2).^2).^(3/2));
        %Compute angular momentum A(t) and Hamiltonian H(t)
        q1 = q(:,1);
        q2 = q(:,2);
        p1 = p(:,1);
        p2 = p(:,2);
        A = q1.*p2 - q2.*p1;
        H = 0.5*(p1.^2 + p2.^2) - 1/sqrt(q1.^2 + q2.^2);
    end
end


















