function [T2T1] = NSW_T2T1(M1)
%This function retuns the static temperature ratio across a normal shock
%wave. The user must provide the upstream Mach number M1. 
%Dimensions: Non-Dimensional
%Assumptions: The specific heat ratio is 1.4 for air.
%Syntax: NSW_T2T1(M1)

%Constants
c=1.4;

a1=2*c*(M1^2-1);
a2=a1/(c+1);
X1=1+a2;
X2=((2+(c-1)*M1^2)/((c+1)*M1^2));

T2T1=X1*X2;

%Checked for accuracy on 7-11-2021

end

