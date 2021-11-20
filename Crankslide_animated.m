clc; clear all;
a=2; b=5; %crank and rod length
P1=[0 0]; %pivot point
w=0.5; %crank angular speed [rad/s]

%plot parameters
axis(gca,'equal'); %same aspect ratio
axis([-2 7 -2 3]); %plot dominium RxR

%cycle 
for t=1:500 %in tenth of sec
    phi=w*t/10; alfa=asin(a*sin(phi)/b);
    P2=a*[cos(phi) sin(phi)];  
    P3=[P2(1)+b*cos(alfa) 0]; %better than P3=[a*cos(phi)+b*cos(alfa) 0];
    %P2_traj=viscircles([0 0],a,'LineStyle','--'); %P2 circle traj
    P2_traj=viscircles(P2, 0.01); %alternative for not circular traj
    P2_circ=viscircles(P2,0.1); %dots for point P
    P3_circ=viscircles(P3,0.1); 
    crank=line([P1(1) P2(1)],[P1(2) P2(2)]);%line syntax 2?
    rod=line([P2(1) P3(1)],[P2(2) P3(2)]);
    pause(0.001); %interval to update the plot
    delete(crank); %delete previous cycle stuff
    delete(rod);
    delete(P2_circ); 
    delete(P3_circ); 
end   
    
