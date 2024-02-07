function [Cp] = pg_rule(Cp_0,Mi)
%This function give the Prandtl-Glauert correction for a given
%incompressible pressure coeficient and the free stream Mach number
%M_infinity. 
%Dimensions: Non-Dimensional
%Assumptions: None
%Syntax: pg_rule(Cp_0,Mi)

Cp=Cp_0/sqrt(1-Mi^2);


end

