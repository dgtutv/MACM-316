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
    xi = -1:(2*i)/n(i, 1):1;
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
    en1(i) = 0;
    en2(i) = 0;
    for j=1:length(interpX)
        x = interpX(j);
        e1 = abs(u1(j) - f1(x));
        e2 = abs(u2(j) - f2(x));
        if e1 > en1(i)
            en1(i) = e1;
        end
        if e2 > en2(i)
            en2(i) = e2;
        end
    end
end
    
%Plot log10(en) vs n for f1
hold on;
grid on;
axis on;
ylabel("log(En)");
xlabel("N");
title("log(En) vs f(x) = 1/(5-4x) with even nodes");
plot(n, abs(log(en1)), "r*");
hold off
figure; 

%Plot log10(en) vs n for f2
hold on;
grid on;
axis on;
ylabel("log(En)");
xlabel("N");
title("log(En) vs f(x) = 1/(1+16*(x^2)) with even nodes");
plot(n, abs(log(en2)), "r*");
hold off
figure;
%Functions
function y = f1(x)
    y=1/(5-4*x);
end
function y = f2(x)
    y=1/(1+16*(x^2));
end