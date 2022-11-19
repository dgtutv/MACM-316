%Define our functions
f0 = @(x) x^3;
%Compute approximation of functions
y0 = trapezoidrule(f0, 0, 1, 100);