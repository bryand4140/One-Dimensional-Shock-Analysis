function [Cp] = kt_rule(Cp_0,Mi)
%This function give the Karman Teisan Rule correction for a given
%incompressible pressure coeficient and the free stream Mach number
%M_infinity. 
%Dimensions: Non-Dimensional
%Assumptions: None
%Syntax: kt_rule(Cp_0,Mi)

x1=sqrt(1-Mi^2);
Cp=Cp_0/(x1+(Mi^2/(1+x1))*(Cp_0/2));

%Checked for accuracy on 8-2-2021

end

