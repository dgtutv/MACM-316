%Define our function to be used in the bisection method
f(x) = besselj(0, x);
%Function that runs an iteration of the bisection method
function p, a, b, converged = bisection(p, a, b, f(x))
    converged = false;
    if f(p_old) == 0
        converged = true;
    elseif sameSign(f(p), f(a))
        a = p;
        p = getP(a, b);
    else 
        b = p;
        p = getP(a, b);
    end
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