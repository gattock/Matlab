 clear all; clc;
% close all (close all graphs)
%variable and constants declaration
m=6;
k1=100;
k2=30;
b=5;
%creating time vector
t= 0: 0.01 : 10 ;
%y vector function of the time vector (mind the dot to multiply .*)
y= 4*sin(5*t) .* exp(-0.15*t);
%tranfer function declaration (sys is an arbitrary name)
sys= tf([2*k1] , [m b 2*k1+k2])

%solution x(t) of the system expressed by the lsim(TF sys, input y, vector time) 
%x,t can be undefined ; sys,y,t MUST be defined
[x,t]=lsim(sys,y,t);
%plot with grid, and labels on axis
figure(1);
plot(t,x); grid on; xlabel('time') ;ylabel ('dynamic response')
hold on %command to plot other functions e.g. plot(t,v)
plot(t,y) %instead could be plot(t,x,t,y) to avoid hold on command

%alternative way: (if i need to plot but NOT to use the results later and
%it automatically plot 
figure(2);
lsim(sys,y,t)




