function [p2p1] = NSW_p2p1(M1)
%This function returns the pressure ratio p2/p1 for a stationary normal
%shockwave provided the user enters the upstream Mach number M1. The
%program assumes a specific heat constant of 1.4 for air. 

%Dimensions: Non-dimensional
%Syntax: NSW_p2p1(M1)

c=1.4; %Specific Heat constant

p2p1=1+(2*c*(M1^2-1))/(c+1);
end

