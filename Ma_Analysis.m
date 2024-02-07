%This program plots the pressure coeficient as a function of Mach number.

%Housecleaning
clear,clc,close all

Cp_A=input('Type the pressure coeficient at point A: ');
Mi=input('Type the upstream Mach number: '); 

Cp_A_plot=linspace(0,-10);

for i=1:length(Cp_A_plot)
    Ma_plot(i)=sqrt((1/0.2)*(-1+(1+0.2*Mi^2)*(0.5*1.4*Mi^2*Cp_A_plot(i)+1)^-(0.4/1.4)));
end

plot(Cp_A_plot,Ma_plot)

