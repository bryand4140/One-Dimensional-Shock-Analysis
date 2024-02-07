clc,clear,close all

Mcr=linspace(0,1);

for i=1:length(Mcr)
    Cp_cr(i)=(2/(1.4*(Mcr(i))^2))*(((1+0.2*(Mcr(i))^2)/(1.2))^(1.4/0.4)-1);
end

M_point=input('Enter Mach number of interest: ');
X1=(2/(1.4*(M_point)^2))*(((1+0.2*(M_point)^2)/(1.2))^(1.4/0.4)-1);
fprintf('Cp for the input Mach = %f\n',X1)


plot(Mcr,Cp_cr,'b')
hold on
xlabel('Upstream Mach Number, M_{\infty}')
ylabel('Pressure Coeficient, C_{p}')
title('M_{\infty} vs. C_{p}')
ylim([-10,0])
xline(M_point)
yline(X1)
text(0.8,-7.0,['Cp_i = ',num2str((2/(1.4*(M_point)^2))*(((1+0.2*(M_point)^2)/(1.2))^(1.4/0.4)-1))])