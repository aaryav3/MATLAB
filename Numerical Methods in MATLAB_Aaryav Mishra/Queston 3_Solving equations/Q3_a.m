%newton raphson method
%initial conditions
x0=0;
maxIter=100;
tolX=10^-4;
x=x0;
xold=x0;
for i=1:maxIter
    f=x^3-2*x+3;
    df=3*x^2-2;
    x=x-f/df;
    
    err=abs(x-xold);
    xold=x;
    if (err<tolX)
        break
    end
end
f=@(x)x^3-2*x+3
ezplot(f);
%The graph doesn't converge in this case

