%function dstatedt= satellite(t,state)
%v=state(4:6);
%planet
%x=state(1);
%y=state(2);
%z=state(3);
%J2=0.001082;
%r=norm([x; y; z]);
%ax=-(mu*x/r^3)*((1+J2*(R/r)^2)*(3/2)*(1-5*(z^2/r^2)));
%ay=-(mu*y/r^3)*((1+J2*(R/r)^2)*(3/2)*(1-5*(z^2/r^2)));
%az=-(mu*z/r^3)*((1+J2*(R/r)^2)*(3/2)*(3-5*(z^2/r^2)));
%a=[ax; ay; az];
%dstatedt=[v;a];
