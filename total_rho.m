function [X1] = total_rho(M)
%This function returns the stagnation to static density ratio for a given 
%Mach number input.

X1=(1+0.2*M^2)^(1/(1.4-1));


end

