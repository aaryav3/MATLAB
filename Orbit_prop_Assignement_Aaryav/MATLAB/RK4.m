function [XRK4] = RK4(X,h,steps)

Xi = X;

for t=1:steps
    
X=rk4orbit(t,X,h);
Xpos(t)=X(1);
Ypos(t)=X(2);
Zpos(t)=X(3);
Vx(t)=X(4);
Vy(t)=X(5);
Vz(t)=X(6);

  

end


plot3(Xpos,Ypos,Zpos)


XRK4 = vertcat(Xpos,Ypos,Zpos,Vx,Vy,Vz);
XRK4 = horzcat(Xi,XRK4);

end


function X = rk4orbit(t,X,h)

    k1 = func_orbit(t,X);
    k2 = func_orbit(t+h/2,X+k1*h/2);
    k3 = func_orbit(t+h/2,X+k2*h/2);
    k4 = func_orbit(t+h,X+k3*h);


X = X+(h/6)*(k1+2*k2+2*k3+k4);

end

function Xdot = func_orbit(t,X)         

    J2=0.00108262668;
    %J2=0;
    Re = 6.37813630000000e3;
    mu  = 3.98600441500000e5;
    rx = X(1);
    ry = X(2); 
    rz = X(3); 
    vx = X(4);               
    vy = X(5);
    vz = X(6);   
    v = X(4:6);
    r = X(1:3);
    %rm=[rx ry rz];
    rmag =norm(r);
    ax = (-1)*((mu*rx*(1+J2*1.5*(Re^2/rmag^2)*(1-5*((rz^2)/(rmag^2)))))/rmag^3);
    ay = (-1)*((mu*ry*(1+J2*1.5*(Re^2/rmag^2)*(1-5*((rz^2)/(rmag^2)))))/rmag^3);
    az = (-1)*((mu*rz*(1+J2*1.5*(Re^2/rmag^2)*(3-5*((rz^2)/(rmag^2)))))/rmag^3);
 
    a = [ax; ay; az];
 
    
    Xdot = [v; a];
end