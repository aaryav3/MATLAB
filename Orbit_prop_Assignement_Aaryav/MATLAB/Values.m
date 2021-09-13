clear;

J=[ 20 -10 0; -10 30 0; 0 0 40];
Jp=eig(J);
w0=[0.00001, 0.01, 0.00001];

% w is omega

%(w1)' = ((J2 - J3)/J1)*w2*w3;
%(w2)' = ((J3 - J1)/J2)*w1*w3;
%(w3)' = ((J1 - J2)/J3)*w2*w1;

t0 = 0;
tend = 10000;
h = 1;
T = (t0:h:tend);
N = (tend - t0)/h;
w1 = zeros(N+1, 1);
w2 = zeros(N+1, 1);
w3 = zeros(N+1, 1);
w1(1) = w0(1);
w2(1) = w0(2);
w3(1) = w0(3);

J1=Jp(1,1);
J2=Jp(2,1);
J3=Jp(3,1);

w = zeros(N+1, 1);
    
for j = 1:N
    fx1 = ((J2 - J3)/J1)*w2(j)*w3(j);
    fy1 = ((J3 - J1)/J2)*w1(j)*w3(j);
    fz1 = ((J1 - J2)/J3)*w2(j)*w1(j);
    
    fx2 = ((J2 - J3)/J1)*(w2(j)+(fx1/2))*(w3(j) + h*(fx1/2));
    fx3 = ((J2 - J3)/J1)*(w2(j)+(fx2/2))*(w3(j) + h*(fx2/2));
    fx4 = ((J2 - J3)/J1)*(w2(j)+(fx3))*(w3(j) + h*(fx3));
    w1(j+1) = w1(j) + (1/6)*h*(fx1 + 2*fx2 + 2*fx3 + fx4);
    
    fy2 = ((J3 - J1)/J2)*(w1(j)+(fy1/2))*(w3(j) + h*(fy1/2));
    fy3 = ((J3 - J1)/J2)*(w1(j)+(fy2/2))*(w3(j) + h*(fy2/2));
    fy4 = ((J3 - J1)/J2)*(w1(j)+(fy3))*(w3(j) + h*(fy3));
    w2(j+1) = w2(j) + (1/6)*h*(fy1 + 2*fy2 + 2*fy3 + fy4);
    
    fz2 = ((J1 - J2)/J3)*(w2(j)+(fz1/2))*(w1(j)+(fz1/2));
    fz3 = ((J1 - J2)/J3)*(w2(j)+(fz2/2))*(w1(j)+(fz2/2));
    fz4 = ((J1 - J2)/J3)*(w2(j)+(fz3))*(w1(j)+(fz3));
    w3(j+1) = w3(j) + (1/6)*h*(fz1 + 2*fz2 + 2*fz3 + fz4);
    
    
end

for j = 1:N
    w(j) = ((w1(j))^2 + (w2(j))^2 + (w3(j))^2 )^(0.5);
end
figure
plot(T,w1);
hold on;
plot(T,w2);
plot(T,w3);
hold off;
%plot3(w1,w2,w3);
%plot(T,w);
