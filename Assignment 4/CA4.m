%plot the bessel
z = 0:0.1:20;
plot(z, besselj(0, z))
%Choose our parameters
M = 10000;
%Calculate the first 3 roots
a1 = 2.4;
b1 = 2.5;
p1 = getP(a1, b1);
roots(1) = bisection(p1, a1, b1, 1e-15);
a2 = 5.5;
b2 = 5.6;
p2 = getP(a2, b2);
roots(2) = bisection(p2, a2, b2, 1e-15);
a3 = 8.5;
b3 = 8.6;
p3 = getP(a3, b3);
roots(3) = bisection(p3, a3, b3, 1e-15);
%Find the average difference between the roots
distance(1) = abs(roots(2)-roots(1));
distance(2) = abs(roots(3)-roots(2));
diff = mean(distance);
%Iterate over the roots M times, using the average distance between the first 3
%roots to increment a
for i=4:M
    a = roots(i-1) + diff;
    b = a + 0.1;
    roots(i) = bisection(roots(i-1), a, b, 1e-15);
    disp(roots(i))
    distance(i-1) = abs(besselj(0, roots(i))-bessroots(i-1));
    diff = mean(distance);
end
disp(roots)

%-----------------------------------FUNCTIONS--------------------------------------------%
%Function that runs the bisection method
function p = bisection(p, a, b, tol)
    while 1
        [p, a, b] = bisectionIteration(p, a, b);
        if f(p) == 0 || (b-a)/2 < tol
            return 
        end
    end
end
%Function that runs the one iteration of the bisection method
function [p, a, b] = bisectionIteration(p, a, b) 
    if sameSign(f(p), f(a))
        a = p;
        p = getP(a, b);
    elseif sameSign(f(p), f(b)) 
        b = p;
        p = getP(a, b);
    else
        error("f(a) & f(b) must have opposite signs");
    end
end
%Function that defines our function
function y = f(x)
    y = besselj(0, x);
end
%Function that computes p for the bisection method
function p = getP(a, b)
    p = (a+b)/2;
end
%Functon that checks if two variables have the same sign
function isSame = sameSign(a, b)
    if(a>=0 && b>=0 || a<0 && b<0)
        isSame = true;
    else
        isSame = false;
    end
end