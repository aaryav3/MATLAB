
%%simulation state
disp('Simulation started')

%%planet parameters
planet

%%Initial conditions
x0=7000.0000000000000000; %%km
y0=0.000000000000000;
z0=0.000000000000000;
xdot0=0.000000000000000;
ydot0=-1.034737378012107;%km/s
zdot0=7.474773493078592;%km/s
stateinitial=[x0;y0;z0;xdot0;ydot0;zdot0];
%J2=0.001082;

h=1;
steps=86400;
a=7000; %km
T=2*pi*(a^3/mu)^0.5; 
[XRK4] = RK4(stateinitial,h,steps);



%Time window
%semi_major=norm([x0;y0;z0]);
%period=2*pi/sqrt(mu)*(semi_major)^3/2;
%orbits=1;
%tspan=[0 period*orbits];
%t0=0;
%tf=period*orbits;
%h=100;

%RK4
%odeset('RelTol',1e-12,'AbsTol',1e-12);
%[tout,stateout]=ode45(@satellite,tspan,stateinitial);
%xout=stateout(:,1);
%yout=stateout(:,2);
%zout=stateout(:,3);


%%plotting the orbit

%fig=figure();
%set(fig, 'color', 'white')
%plot3(xout,yout,zout,'LineWidth',4);
%grid on;
figure;
hold on;
groundtrack(XRK4(1:3,:), w, T, steps);
groundtrack(GM(1:3,:), w, T, steps);
hold off;







