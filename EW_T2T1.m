function [T2T1] = EW_T2T1(M1,M2)
%This function returns the temperature ratio T2/T1 of an expansion wave
%for a given upstream and downstram Mach number. The program assumes a
%specific gas constant of 1.4 for air.
%Dimensions: Non-Dimensional
%Syntax: EW_T2T1(M1,M2)

%Gas Constants
c=1.4; %for air
c2=(c-1)/2;

x1=(1+(c2)*(M1)^2);
x2=(1+(c2)*(M2)^2);

T2T1=x1/x2;
end

