%This program will evaluate the critical Mach number for a given peak
%pressure coeficient (the value at the minimum pressure point). 

%Housecleaning:
clc,clear

Cp_min=input('Type the incompressible pressure coeficient Cp_0: ');
A=input('Type 1 for PG, 2 for KT, 3 for Laitone''s rule: ');

m=linspace(0,0.999);

syms M Cp
lam=sqrt(1-M^2);

if A==1
    for i=1:length(m)
        Cp(i)=pg_rule(Cp_min,m(i));
        E1=Cp_min/sqrt(1-M^2);
    end
elseif A==2
    for i=1:length(m)
        Cp(i)=kt_rule(Cp_min,m(i));
        E1=Cp_0/(sqrt(1-M^2)+(M^2/(1+sqrt(1-M^2)))*(Cp_0/2));
    end
else A==3
    for i=1:length(m)
        Cp(i)=l_rule(Cp_min,m(i));
        E1=Cp_0/(lam+((M^2*(1+0.2*M^2))/(2*lam))*Cp_0);
    end
end

for i=1:length(m)
    Cp_cr_plot(i)=(2/(1.4*(m(i))^2))*(((1+0.2*(m(i))^2)/1.2)^3.5-1);
end

E2=(2/(1.4*(M)^2))*(((1+0.2*(M)^2)/1.2)^3.5-1);
E3=E1==E2;

H=vpasolve(E3,M,[0.001,1]);
M_Critical=double(H)
Y_Cord=(2/(1.4*(M_Critical)^2))*(((1+0.2*(M_Critical)^2)/1.2)^3.5-1);

figure(1)
plot(m,Cp,'b')
hold on
xlabel('Mach Number, M_{\infty}')
ylabel('Pressure Coeficient, C_{p}')
title('Critical Mach Number Analysis')
plot(M_Critical,Y_Cord,'d','MarkerSize',10,'MarkerEdgeColor','k','MarkerFaceColor','k')
plot(m,Cp_cr_plot,'r')
ylim([-2,0])
text(0.3,-0.2,['Mcritical = ',num2str(M_Critical)])
hold off


    




