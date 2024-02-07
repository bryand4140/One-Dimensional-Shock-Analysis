function [PressCoef] = Cp(M,p2p1,c)
%This function returns the pressure coeficient per free stream Mach number
%and pressure ratio.  
%
%Author: Bryan Durham
%
%Inputs:
%   p2/p1 = pressure ratio across the shock wave or expanion fan, [ND]
%   M = Global upstream Mach number (M infinity), [ND]
%   c = Specific heat ratio, [ND]
%Outputs
%   Cp = Non-dimensional pressure coefficient
%Required MATLAB Toolboxes: None
%
%Syntax: Cp(M,p2/p1,c)
%__________________________________________________________________________


PressCoef=(p2p1-1)/(0.5*c*M^2);
end

