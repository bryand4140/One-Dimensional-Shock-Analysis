function [vm] = pmf(M)
%This function evaluates a given Mach number M throughte Prandtl-Meyer
%function. pmf(M)
c=1.4;
vm=sqrt((c+1)/(c-1))*atand(sqrt(((c-1)/(c+1)*(M^2-1))))-atand(sqrt(M^2-1));
end

