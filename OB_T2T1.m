function [T2T1] = OB_T2T1(Mn1)
%This function will return the temperature ratio across an oblique
%shockwave provided the user is in possession of the normal upstream Mach
%component Mn1. Function syntax -> OB_T2T1(Mn1). The output is a
%non-demensional parameter. 

%Useful Constants:
c=1.4; %Specific Gas constant
c2=(c-1)/2;
c3=(2*c)/(c+1);

%Temperature Ratio Calculation: 
X1=(1+(c3)*((Mn1)^2-1));
X2=(2+(c-1)*(Mn1)^2)/((c+1)*(Mn1)^2);

T2T1 = X1*X2;


end

