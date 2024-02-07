%This program is used to evaluate the wave angle (beta) of an oblique
%shock wave using an alternate theory. Given the deflection angle (theta)
%and the upsteam mach number we can find the wave angle without using a
%graphical method. 

%This solutions is not an approximation it is an exact
%relationship.

%Housecleaning
clear,close all,clc

%Input Parameters:
Th=input('Type the value for Theta in degrees: ');
M=input('Type the upstream Mach number: ');
g=input('Type the specific heat constant: ');
delta=input('Type 0 for strong shock solution or 1 for the weak shock solution: ');

%The weak shock solution is usually favored.

%Calculated Parameters
T=Th*(pi/180); %converts theta to radians. 
a=(g-1)/2; 
b=(g+1)/2;
c=(g+1)/4;

lamda=((M^2-1)^2-3*(1+(a)*(M)^2)*(1+(b)*(M)^2)*tan(T)*tan(T))^0.5;

num1=(M^2-1)^3-9*(1+(a)*(M)^2)*(1+(a)*(M)^2+(c)*(M)^4)*tan(T)*tan(T);
den1=(lamda)^3;

X1=num1/den1;

num2=(M)^2-1+2*lamda*cos((4*pi*delta+acos(X1))/3);
den2=3*(1+(a)*(M)^2)*tan(T);

X2=num2/den2;

beta=atan(X2)*(180/pi);
fprintf('\nBeta = %0.5f degrees.\n',beta)












