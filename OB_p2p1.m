function [p2p1] = OB_p2p1(Mn1)
%This function returns the pressure ratio p2/p1 across an oblique shockwave
%provided the user enters the normal componenet of the upstram Mach number.
%Dimensions: The output is non-dimensional
%Syntax: OB_p2p1(Mn1)

%Useful Constants:
c=1.4; %specific gas constant
c3=(2*c)/(c+1);

p2p1=(1+(c3)*((Mn1)^2-1));
end

