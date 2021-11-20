clc; clear all;
r=0.3;l=1; W=0.2; O=[0 0]; 
axis(gca,'equal'); axis([-0.5 1.5 -0.5 1]);

%if strcmp(evnt.Key, 'rightarrow')
%   Xb = Xb + 0.02;
%elseif strcmp(evnt.Key, 'leftarrow')
%   Xb = Xb - 0.02;
%end

B=[0.4 0.3];
Bpoint=viscircles(B,0.02,'Color','g');
for t=1:500
    phi=W*t/10; 
    A=r*[cos(phi) sin(phi)];
    teta=atan( (B(2)-A(2))/(B(1)-A(1)) );
    C=A+l*[cos(teta) sin(teta)];
    Apoint=viscircles(A,0.03);
    Cpoint=viscircles(C,0.03);
    A_traj=viscircles(A,0.001);
    C_traj=viscircles(C,0.001);
    crank=line([0 A(1)],[0 A(2)]);
    rod=line([A(1) C(1)],[A(2) C(2)]);
    pause(0.001);
    %delete(Apoint);delete(Cpoint); delete(crank);delete(rod);
end
