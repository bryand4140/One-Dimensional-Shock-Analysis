function [p02p01] = NSW_p02p01(M1)
%This function returns the total pressure ratio across a normal, stationary
%shock wave. User must provide the upstream Mach number (M1). 
%Dimensions: Non-dimensional
%Assumptions: Gas constant is assumed to be 1.4 for air. 
%Snytax: NSW_p02p01(M1)

%Constants
c=1.4;
a=c/(c-1);

%Calculation of downsteam Mach #:
M2=sqrt((1+0.2*M1^2)/(c*M1^2-0.2));

%Total Pressure Ratio Factors:
X1=(1+0.2*M2^2)^a;
X2=(1+(1/(c+1))*(2*c*(M1^2-1)));
X3=((1+0.2*M1^2)^a)^-1;

%p02/p01
p02p01=X1*X2*X3;


end

