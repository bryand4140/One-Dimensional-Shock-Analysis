function [X] = Cp_cr(Mcr)
%This function returns the critical pressure coeficient per crticical Mach
%number Mcr. 
%Dimensions: non-dimensional
%Assumptions: Specific heat ratio = 1.4 for air.
%Syntax: Cp_cr(Mcr)

X=(2/(1.4*Mcr^2))*(((1+0.2*Mcr^2)/(1+0.2))^(3.5)-1);

end

