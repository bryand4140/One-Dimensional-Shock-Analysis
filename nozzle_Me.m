function [Me] = nozzle_Me(x)
%This function returns the exit Mach number. User must enter the lambda
%value as specified in the equation sheet. 
%Dimensions: Non-Dimensional
%Assumptions: Specific heat ratio of 1.4 for air. 
%Syntax: nozzle_Me(x)

%Specific Heat Constant
c=1.4;

x1=-1/(c-1);
x2=1/(c-1)^2;
x3=(2/(c-1));
x4=(2/(c+1))^(6);
x5=(x)^2;
x6=x1+sqrt(x2+x3*x4*x5);

Me=sqrt(x6);

%Checked for accuracy on 7-26-2021

end

