clear all;
%%input data
%V=[0 0; 0 0.6; -1 0.8];
%sigma=[0.0617 0.0385];
%W=[0.192791 0.462065; -0.668548 0.723997; -0.716968 0.542956];
V=[1 0; 0 1; 0 0];
A_true=[0.352, 0.864, 0.360; -0.864, 0.152, 0.460; 0.360, -0.480, 0.800];
W=A_true*V;
sigma=[0.01 0.01];

%%weights
for i=1:length(sigma)
    x(i)=(sigma(i))^-2;
end

sigma_tot=(sum(x,2))^(-1/2);

for i=1:length(sigma)
    a(i)=(sigma_tot)^2/(sigma(i))^2;
end

%%Attitude profile matrix B
B=a.*W*(V');

%%QUEST
S=B+B';
k=trace(adjoint(S));
z=[B(2,3)-B(3,2);B(3,1)-B(1,3);B(1,2)-B(2,1)];

%newton raphson
f=@(n) (n^2-(trace(B))^2+k)*(n^2-(trace(B))^2-(norm(z))^2)-(n-trace(B))*((z')*S*z + det(S))-z'*(S^2)*z;
df=@(n) 4*n^3 - 2*((norm(z))^2 + 2*(trace(B))^2 - k)*n - ((z')*S*z + det(S));
e= 10^-4;
n0=sum(a,2);
N=10;
for i=1:N
    n1= n0 - f(n0)/df(n0);
    if abs(n1-n0)<e
        break
    end
    n0=n1;
end

%optimal quaternion
lambda_max=n1;
rho=lambda_max+trace(B);
alpha=(lambda_max)^2 - (sigma)*(sigma)' + k;
I=[1 0 0; 0 1 0; 0 0 1];
q=[adjoint(rho*I-S)*z; det(rho*I-S)];
q_o=q/norm(q);
q1=q_o(1);
q2=q_o(2);
q3=q_o(3);
q4=q_o(4);
A_q = [q1^2-q2^2-q3^2+q4^2, 2*(q1*q2+q3*q4), 2*(q1*q3-q2*q4); 2*(q1*q2-q3*q4), -q1^2+q2^2-q3^2+q4^2, 2*(q2*q3+q1*q4); 2*(q1*q3+q2*q4), 2*(q2*q3-q1*q4), -q1^2-q2^2+q3^2+q4^2];










