function [Mn2] = OBmach_normal(Mn1)
%This function returns the normal component of the Mach flow after an
%oblique shockwave provided the user provides Mn1. 
%By default the specific heat constant is set to 1.4
%Function argument --> OBmach_normal(Mn1)

c=1.4;
a=(c-1)*0.5;

X1=1+a*(Mn1)^2;
X2=c*(Mn1)^2-a;
Mn2=sqrt(X1/X2);

end

