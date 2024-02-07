function [p01p1] = total_p(M)
%This function gives the total to static pressure ratio for a given Mach
%number. The user is required to provide only the Mach number in the
%argument. The function assumes that the specific heat constant is 1.4 for
%air. 

%Dimensions: Non-Dimensional
%Syntax: Total_P(M)

c=1.4; %Specific Heat Constant
c2=(1.4-1)/2;

p01p1=(1+(c2)*(M)^2)^(c/(c-1));

end

