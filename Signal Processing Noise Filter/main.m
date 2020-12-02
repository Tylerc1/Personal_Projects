%Tyler Cascalho Cox
clear, clc

% Opening the Data Text File so it can be read
fid = fopen('ExampleData.txt','r');

%Reading the Text into a (2, length) matrix
m = fscanf(fid,'%f %f',[2,Inf]);

%Closing the Text File
t = fclose(fid);

%Storing the time data into the x vector
x= m(1,:);

%Storing the amplitude data into the y vector
y= m(2,:);

%Plotting the x, y data
figure(1)
plot(x,y,'-')
title('Amplitude vs Time')
xlabel('Time in microseconds')
ylabel('Amplitude (a.u.)')

%Smoothing 

%Defining spans that are to be used while doing a running average
span = [11,31,51,71,31,11];

%Taking the new smoothed coordinates ands storing them into a new vector
ynew = Shaving_Time(span,y);
%Plotting the new smoothed function
figure(2)
plot(x,ynew,'-')
ylim([-800 800])
title('Adjusted Amplitude vs Time')
xlabel('Time in microseconds')
ylabel('Adjusted Amplitude (a.u.)')

figure(3)
p=plot(x,y,x,ynew,'-')
p(1).LineWidth = 0.1;
 p(2).LineWidth = 2;
ylim([-800 800])
title('Amplitude vs Time')
xlabel('Time in microseconds')
ylabel('Amplitude (a.u.)')
legend('Unfiltered signal','Filtered Signal')

%Finding the Sin wave
xdata=x;
ydata =y;
fun=@(x1,xdata)(x1(1)*sin(x1(2)*xdata+x1(3)));
x0=[40 0.4  3];
x1 = lsqcurvefit(fun,x0,xdata,ydata);

%Plotting the sin wave
figure(4)
y3=x1(1)*sin(x1(2)*xdata+x1(3));
L=plot(x,y,x,y3,'-')
L(1).LineWidth = 0.1;
 L(2).LineWidth = 2;
title('Overlayed sin fit function with original signal vs Time')
xlabel('Time in microseconds')
ylabel('Amplitude (a.u.)')
legend('Unfiltered signal','Sin function')


%Finding the Sin wave
xdata=x;
ydata =y;
fun=@(x21,xdata)(x21(1)*cos(x21(2)*xdata+x21(3)));
x0=[40 0.4  1];
[x21,resnorm] = lsqcurvefit(fun,x0,xdata,ydata);

%Plotting the cos wave
figure(5)
y41=x21(1)*cos(x21(2)*xdata+x21(3));
G=plot(x,y,x,y41,'-')
G(1).LineWidth = 0.1;
 G(2).LineWidth = 2;
title('Overlayed sin fit function with original signal vs Time')
xlabel('Time in microseconds')
ylabel('Amplitude (a.u.)')
legend('Unfiltered signal','Cos function')

%Trying to find Code :P
figure(6)
y4 = y-ynew;
y5= y-y3;
span2=[11,31,51,21,13];
ynew4 = Shaving_Time(span2,y4);
ynew5 = Shaving_Time(span2,y5);
plot(x,ynew4+ynew5,'-')
title('Filtered Amplitude vs time')
xlabel('Time in microseconds')
ylabel('Amplitude (a.u.)')
%Making the code pretty

%Defining new vectors for use
 ymor=zeros(1,length(y));
 yvv = ynew4+ynew5;
%std2 = std(ynew4+ynew5); %Calculating the Standard Deviation in the smooth curve

%Looping through to make look like M-code
for i = 1:length(y)
    if yvv(i) >= 45 && x(i) >=10
        ymor(i) = 1;
    elseif yvv(i) <= 45 && yvv(i) >= 45-20 && x(i) >=10
       ymor(i) = 1;

    else
       ymor(i) = 0;
    end
        
end
 figure(7)
 plot(x,ymor,'-')
ylim([0 2])
title('Adjusted M-Signal vs time')
xlabel('Time in microseconds')
ylabel('Signal')


%smoothing function

function [ynew2] = Shaving_Time(span,y)

%Defining Vectors and the Matix that are going to be used
ynew = zeros(length(y),length(span)+1);
ynew(:,1) = y';


%Looping though all the columns of the matrix
for j = 2:length(span)

    %Looping through all the rows of each cloumn of the matrix
for i = 1:length(y)
    
    %Checking to see if we are at the front of the y values
    if i<=(span(j)-1)/2 
        
        z = (span(j)-1)/2;
        
        while i-z < 1
            z=z-1;
        end
        
        for n = 1:(span(j))
            ynew(i,j)= ynew(i,j)+ynew(i+z,j-1);
            z=z+1;
        end
        
        %Dividing the Nummerator of the equation by the span used
    ynew(i,j)=ynew(i,j)./span(j);
    
   
    %Checking to see if we are at the end of the y values
    elseif i+(span(j)-1)/2 >= length(y)
        
        z = (span(j)-1)/2;
        
        while i+z > length(y)
            z=z-1;
        end
        
        for n = 1:(span(j))
            ynew(i,j)= ynew(i,j)+ynew(i-z,j-1);
            z=z+1;
        end
        
        %Dividing the Nummerator of the equation by the span used
    ynew(i,j)=ynew(i,j)./span(j);
    
    % If we are not in the front or the back then we must be in the middle
    else
        
         z =-1*((span(j)-1)/2);
 
         for n = 1:(span(j))
             b=abs(i+z);%Making sure it is a positive int
             ynew(i,j)= ynew(i,j)+ynew(b,j-1);
             z=z+1;
         end
         
         %Dividing the Nummerator of the equation by the span used
         ynew(i,j)=ynew(i,j)./span(j);
    end
        
end
end

%Extracting the filtered vector
lk= ynew(:,length(span));
ynew2 = zeros(1,length(y));
ynew2 = ynew2 + lk';
end
