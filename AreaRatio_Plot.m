clc,clear

m1=linspace(0,0.99);
m2=linspace(1.01,4);

for i=1:length(m1)
    a1(i)=a_rat(m1(i));
end

for i=1:length(m2)
    a2(i)=a_rat(m2(i));
end

plot(m1,a1,'b',m2,a2,'m')
xlabel('Mach Number')
ylabel('Area Ratio')
