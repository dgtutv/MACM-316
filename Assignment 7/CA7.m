%Define our mathematical functions
f0 = @(x) x.^3;
f1 = @(x) sin(0.5*x);
f2 = @(x) abs(sin(2*x));
f3 = @(x) cos(x);
%Define our intervals
I1 = [0, pi/3];
I2 = [0, 2*pi];
%Store the actual integral's values in a vector, where index 1 is for interval I1, and index 2 is for interval I2
truef1 = [2-sqrt(3), 4];
%Compute approximation of functions
y0 = trapezoidrule(f0, 0, 1, 100); %Test case with fixed a, b, N
disp(y0); %Show the value of the test case, should converge to 1/4

outputf1 = approximateIntegral(f1, I1, I2, 1000);
disp(outputf1(1,:));
disp(outputf1(2,:));
disp(outputf1(3,:));

%Define out computational functions
function output = approximateIntegral(f, I1, I2, Nmax)
    output = [];
    for N=100:100:Nmax %f1
        output(1,N/100) = N;                                                 %[N0    , N1    , ... ,Nj    ]
        output(2,N/100) = trapezoidrule(f, I1(1), I1(2), N);        %output = [f'(N0), f'(N1), ... ,f'(Nj)] for I1
        output(3,N/100) = trapezoidrule(f, I2(1), I2(2), N);                 %[f'(N0), f'(N1), ... ,f'(Nj)] for I2
    end
end
                               