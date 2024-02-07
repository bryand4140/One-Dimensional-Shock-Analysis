%This program will provide relevant properties for an expansion wave given
%certian user information. 

%Housecleaning
clc,close all, clc

fprintf('Type null in single quotes if information is not available.\n')
M1=input('Type the upstream Mach number: ');
M2=input('Type the downstram Mach number: '); 
T1=input('Input T1 in Kelvin: ');
p1=input('Intput p1 in kPa: '); 

%Useful Constants:
c=1.4;
R=287;
cp=(c*R)/(c-1);

%Spacer
fprintf('\n')

if M1 =='null'& M1== 'null'
    fprintf('Theta not available.\n')
else
    theta = pmf(M2)-pmf(M1);
    fprintf('Deflection angle = %f degrees.\n',theta)
end


%Property Ratios (Only depends on upstream Mach number);
T2T1=(1+((c-1)/2)*(M1)^2)/(1+((c-1)/2)*(M2)^2);
p2p1=((1+((c-1)/2)*(M1)^2)/(1+((c-1)/2)*(M2)^2))^(c/(c-1));

%Downstream Properties
if T1 == 'null'
    fprintf('T2 not available\n')
else
    T2=T1*T2T1;
    fprintf('T2 = %f [K]\n',T2) % T2 must be provided to display this. 
end

fprintf('T2/T1 = %f [-]\n',T2T1) %depends only on M1

if p1 == 'null'
    fprintf('p2 not available.\n')
else
    p2=p1*p2p1;
    fprintf('p2 = %f [kPa]\n',p2)
end

 fprintf('p2/p1 = %f [-]\n',p2p1);






