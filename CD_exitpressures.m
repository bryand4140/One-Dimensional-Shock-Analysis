clc,clear

fprintf('For air only. Assumes steady, adiabatic, inviscid flow.\n')

At=input('Type the throat area: ');
Ae=input('Type the exit area: ');
p0=input('Type the resevior pressure in atm: ');
pb=input('Type the back pressure in atm: ');

[ma,mb]=nozzle_m(Ae/At);

pe3=p0/(1+0.2*ma^2)^3.5;
pe6=p0/(1+0.2*mb^2)^3.5;
pe5=p0*(pe6/p0)*(NSW_p2p1(mb));

fprintf('pe3 = %0.4f\n',pe3)
fprintf('pe6 = %0.4f\n',pe6)
fprintf('pe5 = %0.4f\n',pe5)
