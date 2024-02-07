%Provides property analysis of a convergent/divergent nozzle with given
%resevior properties and critical area ratios. 

%Housecleaning
clear,close all,clc

%Constants
c=1.4; %Specific Heat Ratio
R=287; %Specific heat constant for air

%User Inputs:
warning('Enter null in single quotes for inputs that are not known')
a_ac=input('Type the critical area ratio: ');

if a_ac=='null'
    Me=input('Input exit Mach Number: ');
    A_AC=a_rat(Me);
    pe=input('Type the exit pressure in kPa: ');
    Te=input('Type the exit temperature in Kelvin: ');
    p0epe=iso_p01p1(Me);
    T0eTe=iso_T01T1(Me);
    pR=pe*p0epe;
    TR=Te*T0eTe;
    fprintf('\nRequired Resevour Temperature = %0.4f K\n',TR)
    fprintf('Required Resevour Pressure = %0.4f kPa = %0.4f atm\n',pR,pR/101.325)
    
else
    p_0R=input('Type the reservior pressure in kPa: ');
    T_0R=input('Type the reservior temperature in Kelvin: ');
    [M1,M2]=nozzle_m(a_ac);
    %First Section
    p01p1_1=iso_p01p1(M1);
    T01T1_1=iso_T01T1(M1);

    p1=p_0R/p01p1_1;
    T1=T_0R/T01T1_1;
    a1=sqrt(c*R*T1);
    u1=a1*M1;

    fprintf('\np1 = %0.4f kPa or %0.4f atm\n',p1,p1/101325)
    fprintf('T1 = %0.4f K\n',T1)
    fprintf('a1 = %0.4f m/s\n',a1)
    fprintf('u1 = %0.4f m/s\n\n',u1)

    %Second Section
    p01p1_2=iso_p01p1(M2);
    T01T1_2=iso_T01T1(M2);

    p2=p_0R/p01p1_2;
    T2=T_0R/T01T1_2;
    a2=sqrt(c*R*T2);
    u2=a2*M2;

    fprintf('p1 = %0.4f kPa or %0.4f atm\n',p2,p2/101325)
    fprintf('T1 = %0.4f K\n',T2)
    fprintf('a1 = %0.4f m/s\n',a2)
    fprintf('u1 = %0.4f m/s\n',u2)
end










