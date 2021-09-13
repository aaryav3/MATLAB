%%predefined parameters
J2=0.00108262668;%km5/s2
%w=2e-7; %rad/sec
%w=0.19910213e-6;
mu=3.986004418e5; %km3/s2
r=7000; %km
Re=6371;%km
%i=acos(((-2*w*(mu)^1/2)/J2)*r^7/2);
%i=acos((((-2/3)*w)/(J2*Re*(mu)^0.5))*r^7/2);
i=97.5 ;

%%LTAN
Time=1800; %%input time
SD=23.45; %%input solar declination (degrees)
u=45;  %% input angle from the autumnal equinox to earth's position (degrees)

if Time>=1200
    LTAN=Time*(90/600)-180;
else
    LTAN=Time*(90/600)+180;
end

%%Normal and solar vector in EC
RAAN= u + LTAN;
n=[sin(i)*sin(RAAN); -sin(i)*cos(RAAN); cos(i)];
s=[cos(u); sin(u)*cos(SD); sin(u)*sin(SD)];

%%Beta angle
B=asin(dot(n,s)); %%beta angle 




