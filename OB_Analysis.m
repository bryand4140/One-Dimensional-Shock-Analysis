%This program calculates relevant shock wave properties for an oblique
%wave. It is assumed that the user is in possession of the upstream mach
%number, and the deflection angle. The deflection angle can easily be 
%calculated using existing formulas or thorugh the user created function 
%"OB_defangle(M1,b)". 

%The shock angle is automatically calculated.  

%Housecleaning
clc,clear,close all
format shorteng

fprintf('Type null in single quotes if a value is not known.\n')
M1=input('Type the upstream Mach #: ');
T1=input('Type the upstream temperature T1 in Kelvin: ');
p1=input('Type the upstream pressure p1 in kPa: ');
th1=input('Type the deflection angle (theta) in degrees: ');

if th1 == 'null'
    b=input('Type the shock angle in degrees: ');
    if b == 'null'
        error('Program can not run without either shock angle or deflection angle.')
    end
    th1=OB_defangle(M1,b);
    fprintf('\n\nDeflection angle = %f degrees.\n',th1)
    fprintf('Shock angle = %f degrees\n',b)
else
    b=OB_shockangle(M1,th1); %Shock angle beta. 
    fprintf('\n\nShock Angle Beta = %f degrees.\n',b)
    fprintf('Deflection Angle = %f degrees.\n',th1)
end


%Cp and other important constants
R=287; %Specific gas constant
c=1.4; %Specific heat constant
x1=(c-1)*0.5;
cp=(c*R)/(c-1); %Specific heat at a constant pressure


%Mach Numbers
Mn1=M1*sind(b);
Mn2=sqrt((1+((c-1)/2)*(Mn1)^2)/(c*(Mn1)^2-(c-1)*(1/2)));
M2=Mn2/(sind(b-th1));

%Static Pressure, Density, and Temperature ratios: 
r2r1=((c+1)*(Mn1)^2)/(2+(c-1)*(Mn1)^2);
T2T1=(1+(2*c)*(1/(c+1))*((Mn1)^2-1))*((2+(c-1)*(Mn1)^2)/((c+1)*(Mn1)^2));
p2p1=1+((2*c)/(c+1))*((Mn1)^2-1);

%Change in Entropy:
ds=cp*log(T2T1)-R*log(p2p1);

%Change in Total (Stagnation) Properties
p02p01=exp(-1*ds*(1/R));

%Main Print Statement Section: 
fprintf('Mn1 = %f [-]\n',Mn1)
fprintf('Mn2 = %f [-]\n',Mn2)
fprintf('M2 = %f [-]\n',M2)
fprintf('Rho2/Rho1 = %f [-]\n',r2r1)
fprintf('T2/T1 = %f [-]\n',T2T1)
fprintf('p2/p1 = %f [-]\n',p2p1)

if T1 == 'null'
    fprintf('T2 not available.\n')
else
    fprintf('T2 = %f [K]\n',T1*T2T1)
end

if p1=='null'
    fprintf('P2 not available.\n')
else
    fprintf('p2 = %f [kPa]\n',p1*p2p1) 
    po1=p1*(1+(x1)*M1^2)^(c/(c-1)); 
    fprintf('p01 = %f [kPa]\n',po1) 
    fprintf('p02 = %f [kPa]\n',po1*p02p01) 
end

fprintf('p02/p01 = %f [-]\n',p02p01)
fprintf('Change in Entroy = %f [J/(kg*K)]\n',ds)









