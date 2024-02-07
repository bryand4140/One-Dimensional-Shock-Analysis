function [M1,M2] = nozzle_m(A_Ac)
%This function provides the two Mach number solutions for a given critical
%area ratio. Since the function returns multiple outputs for a single value
%in the argument you must call the function as follows:
%   [M1,M2]=nozzle_m(x).
%Dimensions: Non-Dimensional
%Assumptions: Specific heat constant is 1.4.
%Snytax: nozzle_m(A/Ac)

syms m
E1=A_Ac==sqrt((1/m^2)*((5/6)*(1+(1/5)*m^2))^6);

H1=vpasolve(E1,m,[0,0.9999]);
H2=vpasolve(E1,m,[1.00001,10]);
M1=double(H1);
M2=double(H2);

end

