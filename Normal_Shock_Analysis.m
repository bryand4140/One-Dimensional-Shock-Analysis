%This program evaluates the properties corresponding to a stationary 
%normal shockwave. The specific heat constant (gamma) is assumed to be 1.4
%for air. If a different gas is to be used the value for gamme is listed
%under c on line 10. 

%Housecleaning:
clc,clear

%Useful c constants and others: 
c=1.4; %specific gas constant
cc=(c-1)*0.5; %Commonly used constant
ccc=(2*c)/(c+1); %Commonly used constant

R=287; % J/(kg*K)
cp=(c*R)/(c-1); %J/(kg*K)

%User Inputs
fprintf('Type null in single quotes if value is not known.\n')
M1=input('Type the upstream Mach #: ');

if M1=='null'
    error('Upstream Mach number must be a known value for the program to run.')
end

T1=input('Type the upstream temperature T1 in Kelvin: ');
p1=input('Type the upstream static pressure p1 in kPa: ');
r1=input('Type the upstream density rho_1 in kg/m^3: '); 

%Property Ratio Calculations and downstream Mach: 
M2=sqrt((1+(cc)*(M1)^2)/(c*(M1)^2-cc));
r2r1 = ((c+1)*(M1)^2)/(2+(c-1)*(M1)^1);
u1u2 = r2r1;
u2u1 = (1/(r2r1));
p2p1 = 1+((2*c)/(c+1))*((M1)^2-1);
T2T1 = (1+(ccc)*(M1^2-1))*((2+(c-1)*(M1)^2)/((c+1)*(M1)^2));
h2h1=T2T1;
ds=cp*log(T2T1)-R*log(p2p1);
p02p01 = exp(-ds/R);
T01T1 = 1+(cc)*(M1)^2;
T02T2 = 1+(cc)*(M2)^2;
p01p1 = (1+(cc)*(M1)^2)^(c/(c-1));
p02p2 = (1+(cc)*(M2)^2)^(c/(c-1));

%Logic & Print Statements: 

fprintf('\n\nM2 = %0.4f\n',M2)
fprintf('T2/T1 = %0.4f [-]\n',T2T1)
fprintf('p2/p1 = %0.4f [-]\n',p2p1)
fprintf('rho2/rho1 = %0.4f [-]\n',r2r1)
fprintf('u2/u1 = %0.4f [-]\n',u2u1)
fprintf('h2/h1 = %f [-]\n',h2h1)
fprintf('Specific Entropy Change = %0.4f [J/(kg*K)]\n',ds)

if T1 =='null'
    fprintf('T2 not available.\n')
    fprintf('Speed of sound before and after the wave not available.\n')
else
    T2=T1*T2T1;
    a1=sqrt(c*R*T1); %Speed of sound before the NSW
    a2=sqrt(c*R*T2); %Speed of sound after the NSW
    u2=M2*a2; %Velocity of the airflow before the NSW
    u1=M1*a1; %Velocity of the airflow after the NSW
    fprintf('T2 = %0.4f [K]\n',T2)
end

if p1=='null'
    fprintf('p2 not available.\n')
else
    p2=p1*p2p1;
    fprintf('p2 = %0.4f [kPa]\n',p2)
end

if r1 =='null'
    fprintf('rho2 not available.\n')
else
    r2=r1*r2r1;
    fprintf('rho2 = %0.4f [kg/m^3]\n',r2)
end

fprintf('T01/T1 = %0.4f [-]\n',T01T1)
fprintf('T02/T2 = %0.4f [-]\n',T02T2)
fprintf('p01/p1 = %0.4f [-]\n',p01p1)
fprintf('p02/p2 = %0.4f [-]\n',p02p2)
fprintf('u1 = %0.4f [m/s]\n',u1)
fprintf('u2 = %0.4f [m/s]\n',u2)
fprintf('a1 = %0.4f [m/s]\n',a1)
fprintf('a2 = %0.4f [m/s]\n',a2)


