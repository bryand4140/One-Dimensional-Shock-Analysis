function [Cp] = l_rule(Cp_0,Mi)
%This function returns the Laiton pressure correction for a given
%incompressible pressure coeficient and the free stream Mach number
%M_infinity. 
%Dimensions: Non-Dimensional
%Assumptions: None
%Syntax: l_rule(Cp_0,Mi)


x1=sqrt(1-Mi^2);
x2=(1+0.2*Mi^2)*Mi^2;
x3=2*x1;

Cp=Cp_0/(x1+(x2/x3)*(Cp_0));
%Checked for accuracy on 8-2-2021.
end

