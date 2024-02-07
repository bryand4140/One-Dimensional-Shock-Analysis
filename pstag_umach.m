function [M1] = pstag_umach(M2,p02p01)
%This function finds the upstream Mach number per a given downstream mach
%number and stagnation pressure ratio p02p01. 
%Dimensions: Non-dimensional
%Assumptions: Specific Heat ratio is 1.4

syms M1
E1=p02p01==(1+0.2*M2^2)^3.5*(1+(7/6)*(M1^2-1))*((1+0.2*M1^2)^3.5)^-1;

H=vpasolve(E1,M1,[1,100]);
M1=double(H);

%Checked for accuracy on 7-31-2021

end

