%Function and variable declarations
nodes = [];
en1 = [];
en2 = [];
nMax = 20;
x = [];
f1 = @(x) 1/(5-4*x);
f2 = @(x) 1/(1+16*(x^2));
for n=2:nMax
    %Compute the equally-spaced nodes
    for i=0:n-1
        x(i+1) = -1+(2*i)/(n-1);
    end
    disp(x)
    %Compute grid?
    grid = -1: 2/n-1 : 1;
    %Compute the interpolating polynomial for f1(x) and f2(x)
    w1 = baryweights(x);
    w2 = baryweights(x);
    u1 = baryinterp(x, w1, f1, grid); %<-- something is wrong here
    u2 = baryinterp(x, w2, f2, grid);
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