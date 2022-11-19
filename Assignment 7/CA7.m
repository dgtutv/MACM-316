%Declare our output arrays
%Here the columns are for differing outputs from our N values, and the rows are for
%intervals I1, I2, except the first row which stores the N values
outputf1 = [];                             %[N0    , N1    , ... ,Nj    ]
outputf2 = [];      %for example: outputf = [f'(N0), f'(N1), ... ,f'(Nj)] for I1
outputf3 = [];                             %[f'(N0), f'(N1), ... ,f'(Nj)] for I2
%Define our functions
f0 = @(x) x.^3;
f1 = @(x) sin(0.5*x);
f2 = @(x) abs(sin(2*x));
f3 = @(x) cos(x);
%Define our intervals
I1 = [0, pi/3];
I2 = [0, 2*pi];
%Compute approximation of functions
y0 = trapezoidrule(f0, 0, 1, 100); %Test case with fixed a, b, N
disp(y0); %Show the value of the test case

for N=1:100:1000 %f1
    outputf1(1,end+1) = N;
    outputf1(2,end+1) = trapezoidrule(f1, I1(1), I1(2), N);
    outputf1(3,end+1) = trapezoidrule(f1, I2(1), I2(2), N);
end

disp(outputf1(1,:))
disp(outputf1(2,:))
disp(outputf1(3,:))