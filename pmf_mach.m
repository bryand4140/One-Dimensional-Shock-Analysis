function [M2] = pmf_mach(x)
%This function numerically solves for the downstream Mach number as a
%result of an expansion wave using the Prandtl-Meyer relation (pmf). 
%The function requires the degree value that would be returned by the pmf
%for the downstream Mach number M2. 
%Dimensions: Non-Dimensional
%Assumptions: None
%Syntax: pmf_mach(v(M2))

syms M

%Gas Constant(s):
c=1.4;
a=sqrt((c+1)/(c-1));
b=(c-1)/(c+1);

E1=x==a*atand(sqrt(b*(M^2-1)))-atand(sqrt(M^2-1));
H=vpasolve(E1,M,[0,34]);

M2=double(H);


end

