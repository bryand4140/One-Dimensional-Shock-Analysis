function [T01T1] = total_T(M)
%This function returns the total (stagnation) temperature ratio (T01/T1) 
%for a given Mach number. The user is required to enter the upstream Mach 
%number M1. The function assumes that the specific heat constant is 1.4 
%for air. 

%Dimensions: Non-dimensional
%Syntax: Total_T(M)

%Specific Heat Constants:
c=1.4; %Specific gas constant
c2=(c-1)/2; 

T01T1=(1+(c2)*(M)^2);

end