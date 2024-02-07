%This program provides all the ratios given in Apx A of John D. Anderson's
%introduction to Aerodynamics.

%Housecleaning
clc,close all,clear

M=input('Type the Mach Number: ');

fprintf('\nApx. A ratios\n')
fprintf('\tp0/p = %0.4f\n',total_p(M))
fprintf('\trho_0/rho = %0.4f\n',total_rho(M))
fprintf('\tT0/T = %0.4f\n',total_T(M))
fprintf('\tA/A^* = %0.4f\n',a_rat(M))

