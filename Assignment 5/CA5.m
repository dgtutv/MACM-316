%Function and variable declarations
nodes = [];
en1 = [];
en2 = [];
n = [5; 10; 50; 100; 200; 500; 1000];
%Choose the values we wish to interpolate at
interpX = [-.99, -.73 -.62, -.43 -.25, .12, .31, .49, .59, .86];
for i=1:length(n)
    %Compute the equally-spaced nodes
    xi = -1:2/n(i, 1):1;
    xi=xi';
    %Compute the barryweights
    bw = baryweights(xi);  
    %Calculate the y values of the function at each x in xi
    for j=1:length(xi)
        y1(j,1) = f1(xi(j,1));
        y2(j,1) = f2(xi(j,1));
    end
    %bary interp
    u1 = baryinterp(xi, bw, y1, interpX);
    u2 = baryinterp(xi, bw, y2, interpX);
    %Compute the error of the interpolating polynomial
    eVec1 = [];
    eVec2 = [];
    for x=-1: 2/(n-1) :1
        eVec1(x) = abs(u1(x) - f1(x));
        eVec2(x) = abs(u2(x) - f2(x));
    end
    disp(eVec1)
    disp(eVec2)
    en1(i) = max(eVec1);
    en2(i) = max(eVec2);
end
    
%Plot log10(en) vs n
x = linspace(3, nMax);
plot(x, en1);
figure;
plot(x, en2);

%Functions
function y = f1(x)
    y=1/(5-4*x);
end
function y = f2(x)
    y=1/(1+16*(x^2));
end