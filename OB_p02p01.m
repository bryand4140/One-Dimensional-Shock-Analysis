function [p02p01] = OB_p02p01(M1,b)
%This function returns the total pressure ratio (po2/po1) across an oblique
%shock wave provided the user enters the upstream mach number and the shock 
%angle (beta). The program assumes a specific heat constant of 1.4 for air. 
%Dimensions: Non-dimensional
%Syntax: OB_p02p01(M1,b)

%Specific Heat Constants:
c=1.4; %Specific gas constant
c2=(c-1)/2; 
c3=(2*c)/(c+1);

%Normal Mach Numbers:
Mn1=M1*sind(b);
Mn2=sqrt((1+(c2)*Mn1^2)/(c*Mn1^2-c2));

%Calculation of deflection angle theta:
z1=(M1^2*(sind(b))^2-1);
z2=(M1^2*(c+cosd(2*b))+2);
z3=(2/(tand(b))*(z1/z2));
theta=atand(z3); %Deflection angle theta

%Downstream Mach
M2=Mn2/sind(b-theta); 

%Total Pressure Products:
x1=(1+(c2)*(M2)^2)^(c/(c-1));
x2=(1+(c3)*((Mn1)^2-1));
x3=((1+(c2)*(M1)^2)^(c/(c-1)))^-1;


p02p01=x1*x2*x3; 

%Results quality checked on 7-5-2021 by B.H.Durham
end

