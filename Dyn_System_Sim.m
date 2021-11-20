clc; clear all; 
%parametri
m1=1 ; m2=2 ; m3=4 ;
k1=25 ; k2=15 ; k3=10 ; b=10 ;

%matrici
A=[0 1 0 0 0 0;...
-k1/m1 0 k1/m1 0 0 0;...
0 0 0 1 0 0;...
k1/m2 0 -(k1+k2)/m2 0 k2/m2 0;...
0 0 0 0 0 1;...
0 0 k2/m3 0 -(k2+k3)/m3 -b/m3];

B=[0;1/m1;0;0;0;0];

C=[1 0 0 0 0 0;...
0 0 1 0 0 0;...
0 0 0 0 1 0];

D=[0;0;0]; %or also D=[0]

%tempo e forzante
t=(0:0.01:20);
f=10*sin(2*t) .* exp(-0.2*t);

%soluzione statespace
doremi=ss(A,B,C,D);
figure(1); lsim(doremi,f,t);

[Y,t]=lsim(doremi,f,t);
figure(2); plot(t,f,t,Y(:,3),t,Y(:,2),t,Y(:,1)); grid on;
