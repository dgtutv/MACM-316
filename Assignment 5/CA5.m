close all
%Function and variable declarations
nodes = [];
en1 = [];
en2 = [];
u1 = [];
u2 = [];
n = [100; 150; 200; 250; 300; 350; 400; 450; 500; 550];
%Choose the values we wish to interpolate at
interpX = [-.99, -.73, -.52, -.43, -.2, .15, .31, .49, .59, .86];
for i=1:length(n)
    xi = [];
    %Compute the equally-spaced nodes
    xi = -1:2/n(i, 1):1;
    xi=xi';
    %Compute the barryweights
    bw = baryweights(xi);  
    %Calculate the y values of the function at each x in xi
    y1 = [];
    y2 = [];
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
    for j=1:length(interpX)
        x = interpX(j);
        disp(x)
        eVec1(j) = abs(u1(j) - f1(x));
        eVec2(j) = abs(u2(j) - f2(x));
    end
    en1(i) = max(eVec1);
    en2(i) = max(eVec2);
end
    
%Plot log10(en) vs n for f1
disp(en1)
hold on;
grid on;
axis on;
ylabel("log(En)");
xlabel("N");
title("log(En) vs f(x) = 1/(5-4x) with even nodes");
disp(en1)
plot(n, abs(log(en1)), "r*");
figure;
%Functions
function y = f1(x)
    y=1/(5-4*x);
end
function y = f2(x)
    y=1/(1+16*(x^2));
end