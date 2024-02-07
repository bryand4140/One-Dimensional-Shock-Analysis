%Linear Interpolation between two points

clc, clear

a=input('Type the first pair in brackets: '); %Seperate with a comma (e.g. [1,2])
b=input('Type the second pair in brackets: ');

m=(a(2)-b(2))/(a(1)-b(1));
R=-1*m*a(1)+a(2);

fprintf('\nThe interpolation equation is %0.3fx + %0.3f\n',m,R)
x=input('Enter independant value for linear interpolation: ');

Z=m*x-m*a(1)+a(2);
fprintf('The linear interpolation at point %0.3f is %0.5f\n',x,Z)

