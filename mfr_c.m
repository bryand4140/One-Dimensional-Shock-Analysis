function [m_dot] = mfr_c(p0,T0,At)
%This function returns the mass flow rate of a chockced convergent
%divergent nozzle. The user must provide both the resevior temperature and
%pressure. 
%Dimensions: kg/s
%Assumptions: The specific heat ratio = 1.4 (for air). At = A_Critical,
%R=287 J/(kg*K)
%Syntax: mfr_c(p0,T0)

%Constants
c=1.4; %Specific heat ratio
R=287; %J/(kg*K)

%Main Calculations
X1=(p0*At)/sqrt(T0);
X2=(c/R)*(2/(c+1))^((c+1)/(c-1));
m_dot=X1*sqrt(X2);

end

