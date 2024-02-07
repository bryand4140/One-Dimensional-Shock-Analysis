function [theta] = OS_defangle(M1,beta)
%This function will return the deflection angle theta.
%Function Arguments: OS_defangle(M1,beta) where M1 is the upstream Mach
%number and beta is the shock angle with respect to the incoming flow. 
%The out put is in degrees. 

c=1.4; %Specific Heat Ratio
X1=(M1)^2*sind(beta)*sind(beta)-1;
X2=(M1)^2*(c+cosd(2*beta))+2;
X3=X1/X2;
X4=2*1/(tand(beta));
X5=X4*(X1/X2);
theta=atand(X5);

end

