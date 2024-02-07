%This script returns the ratios that can be found in Apx B for Oblique
%shockwaves. The script also calculates the downstream Mach number
%automaticly. 

%Housecleaning
clc

%Note, the only two variables added to the workspace are the inputs. 
fprintf('Use the function OB_defangle(M,b) if the deflection angle is not known but the shock angle is.\n')
M_input_rat=input('Type upstream Mach Number: ');
th_input=input('Type the deflection angle in degrees: ');



fprintf('\np2/p1 = %0.4f\n',OB_p2p1(M_input_rat*sind(OB_shockangle(M_input_rat,th_input))))
fprintf('T2/T1 = %0.4f\n',OB_T2T1(M_input_rat*sind(OB_shockangle(M_input_rat,th_input))))
fprintf('p02/p01 = %0.4f\n',OB_p02p01(M_input_rat,OB_shockangle(M_input_rat,th_input)))
fprintf('Mn2 = %0.4f\n',OB_machnormal(M_input_rat*sind(OB_shockangle(M_input_rat,th_input))))
fprintf('M2 = %0.4f\n',(OB_machnormal(M_input_rat*sind(OB_shockangle(M_input_rat,th_input))))/sind(OB_shockangle(M_input_rat,th_input)-th_input))

%Checked for Accuracy on 8-9-2021
