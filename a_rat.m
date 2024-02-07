function [A_Acritical] = a_rat(M)
%This function returns the area relation (A/A^*) for a given Mach number.
%Dimensions: Non-Dimensional
%Assumptions: Specific Heat Constant is 1.4.
%Syntax: a_rat(M)

%Specific Heat Constants
c=1.4;
x2=(c+1)/(c-1);

x4=((2/(c+1))*(1+0.2*M^2))^(x2);
x5=(1/M^2)*x4;

A_Acritical=sqrt(x5);

%Checked for accuracy on 7-22-2021. 
end

