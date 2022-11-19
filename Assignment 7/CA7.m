%Define our mathematical functions
f0 = @(x) x.^3;
f1 = @(x) sin(0.5*x);
f2 = @(x) abs(sin(2*x));
f3 = @(x) cos(x);

%Define our intervals
I1 = [0, pi/3];
I2 = [0, 2*pi];

%Store the actual integral's values in a vector, where index 1 is for interval I1, and index 2 is for interval I2
truef1 = [2-sqrt(3), 4];    %0.2679491924311227, 4
truef2 = [3/4, 4];          %.25, 4
truef3 = [sqrt(3)/2, 0];     %0.8660254037844386, 0

%Compute approximation of functions
y0 = trapezoidrule(f0, 0, 1, 100); %Test case with fixed a, b, N
outputf1 = approximateIntegral(f1, I1, I2, 1000);
outputf2 = approximateIntegral(f2, I1, I2, 1000);
outputf3 = approximateIntegral(f3, I1, I2, 1000);

%Output approximations into console for check
fprintf("Test case: %.12f\n",y0);   %Test case
fprintf("f1(x):\n   I1: %.12f\n   I2: %.12f\n",outputf1(2,end), outputf1(3,end));   %f1
fprintf("f2(x):\n   I1: %.12f\n   I2: %.12f\n",outputf2(2,end), outputf2(3,end));   %f2
fprintf("f3(x):\n   I1: %.12f\n   I2: %.12f\n",outputf1(2,end), outputf1(3,end));   %f3


%Define out computational functions
function output = approximateIntegral(f, I1, I2, Nmax)
    output = zeros(3, Nmax/100);
    for N=100:100:Nmax %f1
        output(1,N/100) = N;                                                 %[N0    , N1    , ... ,Nj    ]
        output(2,N/100) = trapezoidrule(f, I1(1), I1(2), N);        %output = [f'(N0), f'(N1), ... ,f'(Nj)] for I1
        output(3,N/100) = trapezoidrule(f, I2(1), I2(2), N);                 %[f'(N0), f'(N1), ... ,f'(Nj)] for I2
    end
end
                               