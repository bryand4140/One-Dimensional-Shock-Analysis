%This program will find the area ratios for a normal shockwave inside a CD
%nozzle.

%Verified on: Still needs to be checked

%Housecleaning
clear,clc

%Assumptions
%   >The fluid is air with a gas constant of 1.4. 
%   >Flow is steady, inviscid, and adiabatic. 

%Inputs
p0=input('Enter the resevior pressure in atm: ');
p_exit=input('Enter the exit pressure in atm: '); 
A1=input('Enter the exit to throat area ratio (Ae/At): '); 

X1=(p0/p_exit)*(1/A1);
Me=nozzle_Me(X1);
p02=p_exit*total_p(Me);

%Equation Solver
syms x %x is the variable for the upstream Mach number before the shockwave. 
X1=sqrt((1+0.2*x^2)/(1.4*x^2-0.2));
E1=p02/p0==((1+0.2*(X1)^2)^(3.5))*(1+(7/6)*(x^2-1))*((1+0.2*x^2)^(3.5))^-1;
H=vpasolve(E1,x,[0,30]);

%Mach Numbers before and after the shockwave
M1=double(H(1)); %Upstream Mach number
M2=NSW_dmach(M1); %Downstream Mach number

%Area Ratios
AS_At=a_rat(M1);
AS_Ae=a_rat(M2);


%Print statements
fprintf('\n') %Spacer
fprintf('Me = %0.5f\n',Me)
fprintf('M1 = %0.5f\n',M1)
fprintf('M2 = %0.5f\n',M2)
fprintf('As/At = %0.5f\n',AS_At)
fprintf('As/Ae = %0.5f\n',AS_Ae)






