function groundtrack(X,T,w,s)
%https://sciencing.com/calculate-antipode-6170267.html
n = s;
lamda = zeros([1,n]);
phi = zeros([1,n]);

for i=1:n
    [lamda(1,i),phi(1,i)] = Geodetic(X(:,i), i,T, w, s);
end

nexttile
plot(lamda*(180/pi), phi*(180/pi))

end


function [lon, lat] = Geodetic(r, i,T,w,s)

R = 6378.137e3;

k=5828;
theta=w*T*i/k;

 

xeci = r(1);              % Cartesian coordinates
yeci = r(2);
zeci = r(3);

%xecef = (((xeci^2)+(yeci^2))^(0.5))*cos(((w*T/s)*(i)) + atan(yeci/xeci)); 
%yecef = (((xeci^2)+(yeci^2))^(0.5))*sin(((w*T/s)*(i)) + atan(yeci/xeci)); 
p = [xeci; yeci];
Rot = [cos(theta), sin(theta) ; -sin(theta), cos(theta)];

pnew = Rot*p;

xecef = pnew(1);
yecef = pnew(2);
zecef = zeci;



lat = (asin(zecef/(R)));
lon = atan2(yecef,xecef);

end
