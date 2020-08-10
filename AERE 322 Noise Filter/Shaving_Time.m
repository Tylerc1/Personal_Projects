
function [ynew2] = Shaving_Time(span,y)
%Tyler Cascalho Cox
%Smoothing Function
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