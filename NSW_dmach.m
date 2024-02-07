function [M2] = NSW_dmach(M1)
%This function returns the downstream Mach number for a stationary normal
%shockwave provided the user enters the upstream Mach number (Mach number
%before the shockwave). 
%Dimension: Non-dimensional
%Syntax: NSW_mach(M1)

%Useful Constants:
c=1.4;
c2=(1.4-1)/2;

x1=(1+(c2)*(M1)^2);
x2=(c*(M1)^2-c2);
x3=x1/x2;

M2=sqrt(x3);
end

