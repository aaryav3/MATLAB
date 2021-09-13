clc; clear all;
%initial conditions
x0=1;
maxIter=100;
tolX=10^-4;
x=x0;
xold=x0;
for i=1:maxIter
    f=log(x)+sin(x);
    df=1/x + cos(x);
    x=x-f/df;
    
    err=abs(x-xold);
    xold=x;
    if (err<tolX)
        break
    end
end
f=@(x)log(x)+sin(x);
ezplot(f);
