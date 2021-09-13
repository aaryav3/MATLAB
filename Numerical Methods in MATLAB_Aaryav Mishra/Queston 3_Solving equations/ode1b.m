function yout = ode1b(F,t0,h,tf,y0)
%Backward Euler method
y=y0;
yout=y;
for t= t0:h:tf:tf-h;
    s=F(t,y);
    y=fsolve(@(y) y-y0-h*s, y0);
    yout=[yout;y];
end