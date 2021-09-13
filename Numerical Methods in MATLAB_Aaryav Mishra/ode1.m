function yout = ode1(F,t0,h,tf,y0)
%Euler method
y=y0;
yout=y;
for t= t0:h:tf:tf-h;
    s=F(t,y);
    y=y0+h*s;
    yout=[yout;y];
end
