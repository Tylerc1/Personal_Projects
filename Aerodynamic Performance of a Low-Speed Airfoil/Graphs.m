%344 Lab 4
clear, clc
%Create an array with all the averages
avg = zeros(9,45);
cphold = zeros(1,24);
% -4 degree
f5 = csvread('344Lab5Data\-4.csv');
i = 1; p = 1;
while (i < 44)
    avg(1,p) = mean(f5(:,i));
    i = i+1;
    p = p+1;
end
avg(1,44) = mean(f5(:,44));
avg(1,45) = mean(f5(:,45));

% 0 degree
f5 = csvread('344Lab5Data\0.csv');
i = 1; p = 1;
while (i < 44)
    avg(2,p) = mean(f5(:,i));
    i = i+1;
    p = p+1;
end
avg(2,44) = mean(f5(:,44));
avg(2,45) = mean(f5(:,45));

% 4 degree
f5 = csvread('344Lab5Data\4.csv');
i = 1; p = 1;
while (i < 44)
    avg(3,p) = mean(f5(:,i));
    i = i+1;
    p = p+1;
end
avg(3,44) = mean(f5(:,44));
avg(3,45) = mean(f5(:,45));

% 6 degree
f5 = csvread('344Lab5Data\6.csv');
i = 1; p = 1;
while (i < 44)
    avg(4,p) = mean(f5(:,i));
    i = i+1;
    p = p+1;
end
avg(4,44) = mean(f5(:,44));
avg(4,45) = mean(f5(:,45));

% 8 degree
f5 = csvread('344Lab5Data\8.csv');
i = 1; p = 1;
while (i < 44)
    avg(5,p) = mean(f5(:,i));
    i = i+1;
    p = p+1;
end
avg(5,44) = mean(f5(:,44));
avg(5,45) = mean(f5(:,45));

% 10 degree
f5 = csvread('344Lab5Data\10.csv');
i = 1; p = 1;
while (i < 44)
    avg(6,p) = mean(f5(:,i));
    i = i+1;
    p = p+1;
end
avg(6,44) = mean(f5(:,44));
avg(6,45) = mean(f5(:,45));

% 12 degree
f5 = csvread('344Lab5Data\12.csv');
i = 1; p = 1;
while (i < 44)
    avg(7,p) = mean(f5(:,i));
    i = i+1;
    p = p+1;
end
avg(7,44) = mean(f5(:,44));
avg(7,45) = mean(f5(:,45));

% 14 degree
f5 = csvread('344Lab5Data\14.csv');
i = 1; p = 1;
while (i < 44)
    avg(8,p) = mean(f5(:,i));
    i = i+1;
    p = p+1;
end
avg(8,44) = mean(f5(:,44));
avg(8,45) = mean(f5(:,45));

% 16 degree
f5 = csvread('344Lab5Data\16.csv');
i = 1; p = 1;
while (i < 44)
    avg(9,p) = mean(f5(:,i));
    i = i+1;
    p = p+1;
end
avg(9,44) = mean(f5(:,44));
avg(9,45) = mean(f5(:,45));

%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%

x = [0 0.0036 0.0306 0.0494 0.0735 0.0962 0.1201 0.1452 0.1921 0.2944 0.3746 0.4365 0.5023 0.613 0.6569 0.7093 0.8004 0.8348 0.8759 0.9367 1 0.9321 0.8549 0.8059 0.7552 0.7042 0.6551 0.6013 0.5496 0.5003 0.4492 0.3982 0.3503 0.2992 0.2493 0.204 0.1487 0.1256 0.098 0.0734 0.0385 0.0207 0.0063 0 ];
y = [0 -0.0126 -0.0293 -0.0355 -0.0418 -0.0462 -0.0502 -0.0539 -0.0585 -0.0641 -0.0653 -0.064 -0.0609 -0.0486 -0.0415 -0.0322 -0.0158 -0.0105 -0.0056 -0.0023 0 0.0177 0.0386 0.0514 0.0639 0.0755 0.0851 0.0935 0.0992 0.1027 0.1045 0.1047 0.1036 0.1015 0.0979 0.093 0.0838 0.0792 0.0725 0.0651 0.0503 0.0383 0.0227 0];


%-4
cp1 = ((avg(1,1:43)-avg(1,44))./(1.1.*(avg(1,45)-avg(1,44))));
figure(1)
plot(x(1:21), cp1(1:21));
set(gca, 'Ydir', 'reverse')
hold on 

cphold(1:23) = cp1(21:43);
cphold(24) = cp1(1);
plot(x(21:44), cphold(1:24))

title("C_p vs x/c");
xlabel("x/c");
ylabel("C_p");
legend("Bottom Surface","Top Surface")
hold off

%0
cp2 = ((avg(2,1:43)-avg(2,44))./(1.1.*(avg(2,45)-avg(2,44))));
figure(2)

plot(x(1:21), cp2(1:21));
set(gca, 'Ydir', 'reverse')
hold on 
cphold(1:23) = cp2(21:43);
cphold(24) = cp2(1);
plot(x(21:44), cphold(1:24))
title("C_p vs x/c");
xlabel("x/c");
ylabel("C_p");
legend("Bottom Surface","Top Surface")
hold off

%4
cp3 = ((avg(3,1:43)-avg(3,44))./(1.1.*(avg(3,45)-avg(3,44))));
figure(3)

plot(x(1:21), cp3(1:21));
set(gca, 'Ydir', 'reverse')
hold on 
cphold(1:23) = cp3(21:43);
cphold(24) = cp3(1);
plot(x(21:44), cphold(1:24))
title("C_p vs x/c");
xlabel("x/c");
ylabel("C_p");
legend("Bottom Surface","Top Surface")
hold off

%6
cp4 = ((avg(4,1:43)-avg(4,44))./(1.1.*(avg(4,45)-avg(4,44))));
figure(4)

plot(x(1:21), cp4(1:21));
set(gca, 'Ydir', 'reverse')
hold on 
cphold(1:23) = cp4(21:43);
cphold(24) = cp4(1);
plot(x(21:44), cphold(1:24))
title("C_p vs x/c");
xlabel("x/c");
ylabel("C_p");
legend("Bottom Surface","Top Surface")
hold off

%8
cp5 = ((avg(5,1:43)-avg(5,44))./(1.1.*(avg(5,45)-avg(5,44))));
figure(5)

plot(x(1:21), cp5(1:21));
set(gca, 'Ydir', 'reverse')
hold on 
cphold(1:23) = cp5(21:43);
cphold(24) = cp5(1);
plot(x(21:44), cphold(1:24))
title("C_p vs x/c");
xlabel("x/c");
ylabel("C_p");
legend("Bottom Surface","Top Surface")
hold off

%10
cp6 = ((avg(6,1:43)-avg(6,44))./(1.1.*(avg(6,45)-avg(6,44))));
figure(6)

plot(x(1:21), cp6(1:21));
set(gca, 'Ydir', 'reverse')
hold on 
cphold(1:23) = cp6(21:43);
cphold(24) = cp6(1);
plot(x(21:44), cphold(1:24))
title("C_p vs x/c");
xlabel("x/c");
ylabel("C_p");
legend("Bottom Surface","Top Surface")
hold off

%12
cp7 = ((avg(7,1:43)-avg(7,44))./(1.1.*(avg(7,45)-avg(7,44))));
figure(7)

plot(x(1:21), cp7(1:21));
set(gca, 'Ydir', 'reverse')
hold on 
cphold(1:23) = cp7(21:43);
cphold(24) = cp7(1);
plot(x(21:44), cphold(1:24))
title("C_p vs x/c");
xlabel("x/c");
ylabel("C_p");
legend("Bottom Surface","Top Surface")
hold off

%14
cp8 = ((avg(8,1:43)-avg(8,44))./(1.1.*(avg(8,45)-avg(8,44))));
figure(8)

plot(x(1:21), cp8(1:21));
set(gca, 'Ydir', 'reverse')
hold on 
cphold(1:23) = cp8(21:43);
cphold(24) = cp8(1);
plot(x(21:44), cphold(1:24))
title("C_p vs x/c");
xlabel("x/c");
ylabel("C_p");
legend("Bottom Surface","Top Surface")
hold off

%16
cp9 = ((avg(9,1:43)-avg(9,44))./(1.1.*(avg(9,45)-avg(9,44))));
figure(9)

plot(x(1:21), cp9(1:21));
set(gca, 'Ydir', 'reverse')
hold on 
cphold(1:23) = cp9(21:43);
cphold(24) = cp9(1);
plot(x(21:44), cphold(1:24))
title("C_p vs x/c");
xlabel("x/c");
ylabel("C_p");
legend("Bottom Surface","Top Surface")
hold off


%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
deltax = zeros(1,43);
deltay = zeros(1,43);
x2 = [0 0.0036 0.0306 0.0494 0.0735 0.0962 0.1201 0.1452 0.1921 0.2944 0.3746 0.4365 0.5023 0.613 0.6569 0.7093 0.8004 0.8348 0.8759 0.9367 1 0.9321 0.8549 0.8059 0.7552 0.7042 0.6551 0.6013 0.5496 0.5003 0.4492 0.3982 0.3503 0.2992 0.2493 0.204 0.1487 0.1256 0.098 0.0734 0.0385 0.0207 0.0063];
y2 = [0 -0.0126 -0.0293 -0.0355 -0.0418 -0.0462 -0.0502 -0.0539 -0.0585 -0.0641 -0.0653 -0.064 -0.0609 -0.0486 -0.0415 -0.0322 -0.0158 -0.0105 -0.0056 -0.0023 0 0.0177 0.0386 0.0514 0.0639 0.0755 0.0851 0.0935 0.0992 0.1027 0.1045 0.1047 0.1036 0.1015 0.0979 0.093 0.0838 0.0792 0.0725 0.0651 0.0503 0.0383 0.0227];
x3 = zeros(1,43);
y3 = zeros(1,43);
p1 = zeros(1,43);
p2 = zeros(1,43);
p3 = zeros(1,43);
p4 = zeros(1,43);
p5 = zeros(1,43);
p6 = zeros(1,43);
p7 = zeros(1,43);
p8 = zeros(1,43);
p9 = zeros(1,43);


i=1;
while(i<43)
    
    deltax(i) = x2(i+1)-x2(i);
    deltay(i) = y2(i+1)-y2(i);
    x3(i) = 0.5*(x(i)+x(i+1));
    y3(i) = 0.5*(y(i)+y(i+1));
    p1(i) = 0.5*(avg(1,i) + avg(1,i+1));
    p2(i) = 0.5*(avg(2,i) + avg(2,i+1));
    p3(i) = 0.5*(avg(3,i) + avg(3,i+1));
    p4(i) = 0.5*(avg(4,i) + avg(4,i+1));
    p5(i) = 0.5*(avg(5,i) + avg(5,i+1));
    p6(i) = 0.5*(avg(6,i) + avg(6,i+1));
    p7(i) = 0.5*(avg(7,i) + avg(7,i+1));
    p8(i) = 0.5*(avg(8,i) + avg(8,i+1));
    p9(i) = 0.5*(avg(9,i) + avg(9,i+1));
    i = i+1;
    
    
end

    deltax(43) = x2(1)-x2(43);
    deltay(43) = y2(1)-y2(43);
    x3(43) = 0.5*(x(43)+x(1));
    y3(43) = 0.5*(y(43)+y(1));
    p1(43) = 0.5*(avg(1,43) + avg(1,1));
    p2(43) = 0.5*(avg(2,43) + avg(2,1));
    p3(43) = 0.5*(avg(3,43) + avg(3,1));
    p4(43) = 0.5*(avg(4,43) + avg(4,1));
    p5(43) = 0.5*(avg(5,43) + avg(5,1));
    p6(43) = 0.5*(avg(6,43) + avg(6,1));
    p7(43) = 0.5*(avg(7,43) + avg(7,1));
    p8(43) = 0.5*(avg(8,43) + avg(8,1));
    p9(43) = 0.5*(avg(9,43) + avg(9,1));

    N1 = sum(p1.*deltax);
    N2 = sum(p2.*deltax);
    N3 = sum(p3.*deltax);
    N4 = sum(p4.*deltax);
    N5 = sum(p5.*deltax);
    N6 = sum(p6.*deltax);
    N7 = sum(p7.*deltax);
    N8 = sum(p8.*deltax);
    N9 = sum(p9.*deltax);
    N = [N1 N2 N3 N4 N5 N6 N7 N8 N9];
    
    A1 = -sum(p1.*deltay);
    A2 = -sum(p2.*deltay);
    A3 = -sum(p3.*deltay);
    A4 = -sum(p4.*deltay);
    A5 = -sum(p5.*deltay);
    A6 = -sum(p6.*deltay);
    A7 = -sum(p7.*deltay);
    A8 = -sum(p8.*deltay);
    A9 = -sum(p9.*deltay);
    A = [A1 A2 A3 A4 A5 A6 A7 A8 A9];

    M1 = -sum((p1.*deltax).*x3)-sum((p1.*deltay).*y3);
    M2 = -sum((p2.*deltax).*x3)-sum((p2.*deltay).*y3);
    M3 = -sum((p3.*deltax).*x3)-sum((p3.*deltay).*y3);
    M4 = -sum((p4.*deltax).*x3)-sum((p4.*deltay).*y3);
    M5 = -sum((p5.*deltax).*x3)-sum((p5.*deltay).*y3);
    M6 = -sum((p6.*deltax).*x3)-sum((p6.*deltay).*y3);
    M7 = -sum((p7.*deltax).*x3)-sum((p7.*deltay).*y3);
    M8 = -sum((p8.*deltax).*x3)-sum((p8.*deltay).*y3);
    M9 = -sum((p9.*deltax).*x3)-sum((p9.*deltay).*y3);
    M = [M1 M2 M3 M4 M5 M6 M7 M8 M9];
    
    alpha = [-4 0 4 6 8 10 12 14 16];
    
    L = N.*cosd(alpha) - A.*sind(alpha);
    D = N.*sind(alpha) + A.*cosd(alpha);
    
    CL = L;
    CD = D;
    CM = M;
    i=1;
    while(i<10)
    CL(i)=(CL(i))./(1.1.*(avg(i,45)-avg(i,44)));
    CD(i)=(CD(i))./(1.1.*(avg(i,45)-avg(i,44)));
    CM(i)=(CM(i))./(1.1.*(avg(i,45)-avg(i,44)));
    i= i+1;
    end
    z2 = linspace(-4,16,40);
    %Lift
    figure(10)
    p1 = polyfit(alpha,CL,5);
    
    hold on
    plot(alpha, CL,"o")
    plot(z2, polyval(p1,z2))
    title("Lift Coefficent vs Angle of Attack");
    xlabel("Angle of Attack (\alpha in degrees)");
    ylabel("Lift Coefficent (C_L)");
    legend("Raw data","Best Fit")
    hold off

    %Drag
    figure(11)
    p2 = polyfit(alpha,CD,4); 
    hold on
    plot(alpha, CD,"o")
    plot(z2, polyval(p2,z2))
    title("Drag Coefficet vs Angle of Attack");
    xlabel("Angle of Attack (\alpha in degrees)");
    ylabel("Drag Coefficent (C_D)");  
    legend("Raw data","Best Fit")
    hold off
    
    %Moment
    figure(12)
    p3 = polyfit(alpha,CM,6); 
    hold on
    plot(alpha, CM,"o")
    plot(z2, polyval(p3,z2))
    title("Moment Coefficent vs Angle of Attack");
    xlabel("Angle of Attack (\alpha in degrees)");
    ylabel("Moment Coefficent");
    legend("Raw data","Best Fit")
    hold off
