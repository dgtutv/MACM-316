%Calculate the first two roots
a1 = 0;
b1 = 3;
p1 = getP(a1, b1);
roots(1) = bisection(p1, a1, b1, 1e-6);
a2 = 5;
b2 = 7.5;
p2 = getP(a2, b2);
roots(2) = bisection(p2, a2, b2, 1e-6);
%Calculate the third root as root 1 & 2 were calculated
disp(roots)
%Calculate the third root by putting the second root in fpr 



%-----------------------------------FUNCTIONS--------------------------------------------%
%Function that runs the bisection method
function p = bisection(p, a, b, tol)
    converged = false;
    while ~converged
        [p, a, b, converged] = bisectionIteration(p, a, b, tol);
    end
end
%Function that runs the one iteration of the bisection method
function [p, a, b, converged] = bisectionIteration(p, a, b, tol)
    converged = false;
    if f(p) == 0 || (b-a)/2 < tol
        converged = true;
    elseif sameSign(f(p), f(a))
        a = p;
        p = getP(a, b);
    else 
        b = p;
        p = getP(a, b);
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