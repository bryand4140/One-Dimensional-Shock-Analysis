%Supersonic Airfoil Analysis

%Property of Bryan H. Durham
% See the picture saved in OneDrive--> UTA --> MEA 3303--> Equation sheet
%for help on entering different parameters. 

%Purpose: This program will return appropriate aerodyanmic coeficients per
%user input. 

%Assumptions: 
%   >Inviscid Flow (cf=0)
%   >Steady, adiabatic flow


%Housekeeping:
clear,close all, clc

%Specific Heat ratio for air. 
gamma_air=1.4;

%Inputs for airfoil geometry: 
warning('Type the interior angles in brackets with each value seperated by a comma.')
a=input('Type the inerior angles in degrees from theta 1 to 4 as shown in the equation sheet diagram: ');
a1=a(1); %Theta 1 in diagram
a2=a(2); %Theta 2 in diagram
a3=a(3); %Theta 3 in diagram
a4=a(4); %Theta 4 in diagram

%C-axis distances are defined as follows:
%L1 is the distance from the leading edge to the upper chamber peak in the
%   c-axis direction. 
%L2 is the distance from the upper chamber peak to the trailing edge in the
%   c-axis direction.
%L3 is the distance from the leading edge to the lower chamber peak in the
%   c-axis direction. 
%L4 is the distance from the lower chamber peak to the trailing edge in the
%   c-axis direction.
L=input('Enter the 4 c-axis distances in brackets as shown in the figure: ');
c=input('Enter chord length: ');

%X_bar lengths (normalized with respect to the chord).
l1=L(1)/c; %Upper leading edge to peak normalized x_bar distance
l2=L(2)/c; %Upper peak to trialing edge normalized x_bar distance
l3=L(3)/c; %Lower leading edge to lower peak normalized x_bar distance
l4=L(4)/c; %Lower peak to trialing edge normalized x_bar distance


%Inputs for aerodynamic conditions
alpha=input('Enter angle of attack in degrees: ');
M1=input('Enter upstream Mach number: '); 


%Deflection Angles
th_u1=alpha-a1; %First upper deflection angle
th_u2=a1+a2;    %Second deflection angle. 
th_l1=alpha+a3; %First deflection angle on the lower airfoil surface
th_l2=a3+a4;    %Second deflection angle after the lower peak point. 

%Peak Heights:
H1=tand(a1)*L(1);
H2=tand(a3)*L(2); %Positive height here

%Upper Mach Numbers % Pressure Ratios
M2u=pmf_mach(th_u1+pmf(M1));
M3u=pmf_mach(th_u2+pmf(M2u));
p2p1_u=EW_p2p1(M1,M2u);
p3p2_u=EW_p2p1(M2u,M3u);
p3p1_u=(p3p2_u)*(p2p1_u);

%Upper Pressure Coeficients: 
Cp_u1=Cp(p2p1_u,M1);
Cp_u2=Cp(p3p1_u,M1);


%Lower Mach numbers and pressure ratios: 
%Section L1
b=OB_shockangle(M1,th_l1);
Mn1=M1*sind(b);
Mn2=OB_machnormal(Mn1);
M2l=Mn2/sind(b-th_l1);
p2p1_l=OB_p2p1(Mn1);

%Section L2
M3l=pmf_mach((a3+a4)+pmf(M2l));
p3p2_l=EW_p2p1(M2l,M3l);
p3p1_l=(p3p2_l)*(p2p1_l);

%Lower Pressure Coeficients
Cp_l1=Cp(p2p1_l,M1);
Cp_l2=Cp(p3p1_l,M1);

%Normal Coefficient
cn=int_c(Cp_l1,0,l3)+int_c(Cp_l2,l3,1)-int_c(Cp_u1,0,l1)-int_c(Cp_u2,l1,1);

%Axial Coeficient
ca=int_c(Cp_u1*tand(a1),0,l1)+int_c(Cp_u2*tand(-a2),l1,1)...
    -int_c(Cp_l1*tand(-a3),0,l3)-int_c(Cp_l2*tand(a4),l3,1);

%Moment about the leading edge coeficient: 
Phi1=int_c((Cp_u1*(l1/2)),0,l1)+int_c((Cp_u2*((l2+1)/2)),l1,1)...
    -int_c((Cp_l1*(l3/2)),0,l3)-int_c((Cp_l2*((l3+1)/2)),l3,1);

x1=Cp_u1*tand(a1)*(H1/(2*c));
x2=Cp_u2*tand(-a2)*(H1/(2*c));
x3=Cp_l1*tand(-a3)*(-H2/(2*c));
x4=Cp_l2*tand(a4)*(-H2/(2*c));

Phi2=int_c(x1,0,l1)+int_c(x2,l1,1)-int_c(x3,0,l3)-int_c(x4,l3,1);

c_mLE=Phi1+Phi2;

%Lift and Drag Coeficients

cl=cn*cosd(alpha)-ca*sind(alpha);
cd=cn*sind(alpha)+ca*cosd(alpha); 

%Print Statements

fprintf('\n\nResults:\n')
fprintf('Cp_u1 = %f\n',Cp_u1)
fprintf('Cp_u2 = %f\n',Cp_u2)
fprintf('Cp_l1 = %f\n',Cp_l1)
fprintf('Cp_l2 = %f\n',Cp_l2)
fprintf('cn = %f\n',cn)
fprintf('ca = %f\n',ca)
fprintf('cm_LE = %f\n',c_mLE)
fprintf('cl = %f\n',cl)
fprintf('cd = %f\n',cd)




















