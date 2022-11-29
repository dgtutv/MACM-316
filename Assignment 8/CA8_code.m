%Initial values & Solve
e = 0.6;
y = [1-e, 0; 0, sqrt(((1+e)/(1-e)))];
f = @(t, y) [y(2,:); -y(1,:)/((y(1,1).^2 + y(1,2).^2).^(3/2))];
a = 0;
b = 200;
h = 0.0005;
t = a:h:b-h;
[q, p, A, H, qS, pS, AS, HS] = Euler(y, f, h, a, b);       %Compute with regular Euler's Method
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
figure(1);
close all;
grid on;
title("Approximate position of the planet at time tn (standard Euler's)");
xlabel("q1(t)");
ylabel("q2(t)");
plot(q1, q2);

%Plot A(t)
figure(2);
subplot(2,1,1);
grid on;
title("Angular momentum vs time (standard Euler's)");
xlabel("Time");
ylabel("Angular Momentum");
plot(t, A);

%Plot H(t)
figure(3);
grid on;
title("Hamiltonian vs time (standard Euler's)");
xlabel("Time");
ylabel("Hamiltonian");
plot(t, H);

%-----------------------Symplectic Euler plots----------------------------%

%Plot in q1-q2 plane
figure(4);
grid on;
title("Approximate position of the planet at time tn (symplectic Euler's)");
xlabel("q1(t)");
ylabel("q2(t)");
plot(q1S, q2S);

%Plot A(t)
figure(5);
subplot(2,1,1);
grid on;
title("Angular momentum vs time (symplectic Euler's)");
xlabel("Time");
ylabel("Angular Momentum");
plot(t, AS);

%Plot H(t)
subplot(2,1,2);
grid on;
title("Hamiltonian vs time (symplectic Euler's)");
xlabel("Time");
ylabel("Hamiltonian");
plot(t, HS);



%--------------------------Euler's Method---------------------------------%
function [q, p, A, H, qS, pS, AS, HS] = Euler(y, f, h, a, b)
    N = (b-a)/h;
    t = a;
    qS = y(1,:);
    pS = y(2,:);
    for i = 2:N
        %Regular Euler's with A and H calculations
        y = y + h*f(t, y);
        t = t + h;
        A(i) = y(1,1)*y(2,2) - y(1,2)*y(2,1);
        H(i) = 0.5*(y(2,1)^2 + y(2,2)^2) - (1/sqrt(y(1,1)^2 + y(1,2)^2));
        %Seperate q and p for easier understanding of whats happening
        q(i,:) = y(1,:);
        p(i,:) = y(2,:);
        
        %Symplectic Euler's with A and H calculations
        qS(i,:) = [qS(i-1,1) + h*pS(i-1,1),  qS(i-1,2) + h*pS(i-1,2)];
        pS(i,:) = [pS(i-1,1) - (h/(qS(i,1)^2 + qS(i,2)^2)^(3/2)) .* qS(i,1),   pS(i-1,2) - (h/(qS(i,1)^2 + qS(i,2)^2)^(3/2)) .* qS(i,2)];
        AS(i) = qS(i,1)*pS(i,2) - qS(i,2)*pS(i,1);
        HS(i) = 0.5*(pS(i,1)^2 + pS(i,2)^2) - (1/sqrt(qS(i,1)^2 + qS(i,2)^2));
    end
end             


















