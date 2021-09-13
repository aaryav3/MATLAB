clear all;
Values;

%t0 = 0;
%tend = 10000;
%h = 1;
%T = (t0:h:tend);
%N = (tend - t0)/h;
phi0=0;
theta0=0;
psi0=0;
q= zeros(4, N+1);
q0=[cos(phi0/2)*cos(theta0/2)*cos(psi0/2)+sin(phi0/2)*sin(theta0/2)*sin(psi0/2); sin(phi0/2)*cos(theta0/2)*cos(psi0/2)-cos(phi0/2)*sin(theta0/2)*sin(psi0/2); cos(phi0/2)*sin(theta0/2)*cos(psi0/2)+sin(phi0/2)*cos(theta0/2)*sin(psi0/2); cos(phi0/2)*cos(theta0/2)*sin(psi0/2)-sin(phi0/2)*sin(theta0/2)*cos(psi0/2)];
q(1,1) = q0(1);
q(2,1) = q0(2);
q(3,1) = q0(3);
q(4,1) = q0(4);
%q(1,1) = 0;
%q(2,1) = 0;
%q(3,1) = 0;
%q(4,1) = 1;


for j=1:N
    q_dot=(1/2)*[q(4,j), -q(3,j), q(2,j); q(3,j), q(4,j), -q(1,j); -q(2,j), q(1,j), q(4,j); -q(1,j), -q(2,j), -q(3,j)]*[w1(j); w2(j); w3(j)];
    q(:,j+1)=q(:,j)+h*(q_dot);
end
figure
plot3(q(1,:),q(2,:),q(3,:));
