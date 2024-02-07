function [beta] = OB_shockangle(M,theta)
%This function will give a shock wave angle (beta) for user input Theta and
%upstream Mach Number M1. The function assumes that the specific heat ratio
%is 1.4 and the weak solution is required. If the specific heat is not air
%or the strong solutions is required "WaveAngle_Calculator.m" must be used.
%OB_shockangle(M1,theta)

g=1.4;
delta=1;
T=theta*(pi/180); %converts theta to radians. 
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

end

