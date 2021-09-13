

%%initial conditions
B= 0; %Beta angle
u= pi/4; %angle between autumnal equinox and earth's position
n= pi/8; %solar declination
i=0.54167*pi; %orbit inclination

%%LTAN calculation
syms x
eqn= (sin(B)-cos(i)*sin(u)*sin(n))*x^2 - sin(i)*(2*cos(n)+sin(n)*cos(u))*x + sin(B)-cos(i)*sin(u)*sin(n) + sin(i)*sin(n)*cos(u)== 0;
s_x=solve(eqn,x);

Ltan=atan(s_x)-u;
