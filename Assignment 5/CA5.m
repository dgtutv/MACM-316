%Function and variable declarations
nodes = [];
n = 20;
f1(x) = 1/(5-4*x);
f2(x) = 1/(1+16*(x^2));
%Compute the equally-spaced nodes
for i=0:n
    nodes(i) = -1+(2*i)/n;
end
%Compute the interpolating polynomial for f1(x) and f2(x)
w1 = baryweights(nodes);
w2 = baryweights(nodes);
u1 = baryinterp(nodes, w1, f1(x), nodes);
u2 = baryinterp(nodes, w2, f2(x), nodes);
%Compute the error of the interpolating polynomial
eVec1 = [];
eVec2 = [];
for x=0:n
    eVec1 = abs(u1(x) - f1(x));
    eVec2 = abs(u2(x) - f2(x));
end
en1 = max(eVec1);
en2 = max(eVec2