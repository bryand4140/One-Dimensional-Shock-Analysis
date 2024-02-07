function [p0p] = NSW_p0p(M1)
%This function provides the total (stagnation) to static pressure ratio for
%a given mach number M1. User must provide M1. 
%Dimensions: Non-dimensinoal
%Assumptions: Specific heat constant is 1.4 for air.
%Syntax: NSW_p0p(M1)

p0p=(1+0.2*M1^2)^(1.4/0.4);
end

