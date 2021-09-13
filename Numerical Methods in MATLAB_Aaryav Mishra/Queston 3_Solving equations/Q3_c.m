clc; clear all;
%initial conditions
x0=1;
maxIter=100;
tolX=10^-4;
x=x0;
xold=x0;
for i=1:maxIter
    f=atan(x)+cot(x)+exp(x^2+x)-20;
    df=1/(1+x^2)-(csc(x))^2+(2*x+1)*exp(x^2+x);
    x=x-f/df;
    
    err=abs(x-xold);
    xold=x;
    if (err<tolX)
        break
    end
end
f=@(x)atan(x)+cot(x)+exp(x^2+x)-2;
ezplot(f);
