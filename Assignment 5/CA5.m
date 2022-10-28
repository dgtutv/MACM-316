%Function and variable declarations
nodes = [];
en1 = [];
en2 = [];
nMax = 20;
f1 = @(x) 1/(5-4*x);
f2 = @(x) 1/(1+16*(x^2));
for n=3:nMax
    %Compute the equally-spaced nodes
    for i=0:n
        nodes(i+1) = -1+(2*i)/n;
    end
    %Compute the interpolating polynomial for f1(x) and f2(x)
    w1 = baryweights(nodes);
    w2 = baryweights(nodes);
    u1 = baryinterp(nodes, w1, f1, nodes);
    u2 = baryinterp(nodes, w2, f2, nodes);
    %Compute the error of the interpolating polynomial
    eVec1 = [];
    eVec2 = [];
    for x=-1: 2/(n-1) :1
        eVec1 = abs(u1(x) - f1(x));
        eVec2 = abs(u2(x) - f2(x));
    end
    en1(n) = max(eVec1);
    en2(n) = max(eVec2);
end
%Plot log10(en) vs n
x = linspace(3, nMax);
plot(x, en1);
figure;
plot(x, en2);