%This program provides all the normal shock ratios as found in Apx. B. 

%The only variable added to the workspace is the input for the mach number.
%Housecleaning
clc

%User Inputs:
M_rat_input=input('Type the upstream Mach Number: '); 



%Print Statements:
fprintf('\np2/p1 = %0.4f\n',NSW_p2p1(M_rat_input))
fprintf('rho2/rho1 = %0.4f\n',(2.4*M_rat_input^2)/(2+0.4*M_rat_input^2))
fprintf('T2/T1 = %0.4f\n',NSW_T2T1(M_rat_input))
fprintf('p02/p01 = %0.4f\n',NSW_p02p01(M_rat_input))
fprintf('p02/p1 = %0.4f\n',NSW_p02p01(M_rat_input)*total_p(M_rat_input))
fprintf('M2 = %0.4f\n',NSW_dmach(M_rat_input))

%Verififed for accuracy on 8-9-2021. 
