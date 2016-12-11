function [ t,x,V ] = RK4_race( h,x0,V0,p )
%Uses 4th Order Runge-Kutta based on race functions and outputs elapsed
%time, distance, and velocity vectors
%Note: in this function V denotes velocity

%Define parameters:
m = p(1);       %mass of train (kg)
mw = p(2);      %wheel mass (kg)
D = p(3);       %diameter of train (outer m)
Lt = p(4);      %length of train (m)
rho = p(5);     %density of air (kg/m^3)
Cd = p(6);      %drag coefficient 
Cr = p(7);      %rolling resistance coefficient
Lr = p(8);      %piston stroke length (m)
g = p(9);       %accelertion due to gravity (m/s^2)
rp = p(10);     %pinion gear radius (m)
rw = p(11);     %wheel radius (m)
P0 = p(12);     %initial tank pressure (pa)
Dp = p(13);     %piston diameter (inner m)
A = p(14);      %frontal area (m)
Patm = p(15);   %atmospheric pressure (Pa)

Vol0 = pi/4 * D^2 * Lt;  %volume of tank
Ap = pi/4 * Dp^2;         %area of piston head

%Unitial velocity and displacement (and time)
V(1) = V0;  
x(1) = x0;
t(1) = 0;   %Initial time is 0

%Acceleration
f1 = @(tt,xx,vv) vv;
f2 = @(tt,xx,vv) (m + mw/2)^(-1) * (rp*Ap/rw * ((P0*Vol0/(Vol0+Ap*rp/rw*(xx)))-Patm)...
    -1/2*Cd*rho*A*(vv)^2 - Cr*m*g);
%Deceleration
f3 = @(tt,xx,vv) vv;
f4 = @(tt,xx,vv) -Cd*rho*A*(vv)^2 / (2*m) - Cr*g;

i = 1;  %incrementing variable
while (true)
    if x(i) <= (Lr * rw/rp)   %acceleration stage
        k11 = f1(t(i),x(i),V(i));   %calculate all k values
        k12 = f2(t(i),x(i),V(i));
        k21 = f1(t(i)+.5*h,x(i)+.5*k11*h,V(i)+.5*k12*h);
        k22 = f2(t(i)+.5*h,x(i)+.5*k11*h,V(i)+.5*k12*h);
        k31 = f1(t(i)+.5*h,x(i)+.5*k21*h,V(i)+.5*k22*h);
        k32 = f2(t(i)+.5*h,x(i)+.5*k21*h,V(i)+.5*k22*h);
        k41 = f1(t(i)+h,x(i)+k31*h,V(i)+k32*h);
        k42 = f2(t(i)+h,x(i)+k31*h,V(i)+k32*h); 
    else    %deceleration stage
        k11 = f3(t(i),x(i),V(i));   %calculate all k values
        k12 = f4(t(i),x(i),V(i));
        k21 = f3(t(i)+.5*h,x(i)+.5*k11*h,V(i)+.5*k12*h);
        k22 = f4(t(i)+.5*h,x(i)+.5*k11*h,V(i)+.5*k12*h);
        k31 = f3(t(i)+.5*h,x(i)+.5*k21*h,V(i)+.5*k22*h);
        k32 = f4(t(i)+.5*h,x(i)+.5*k21*h,V(i)+.5*k22*h);
        k41 = f3(t(i)+h,x(i)+k31*h,V(i)+k32*h);
        k42 = f4(t(i)+h,x(i)+k31*h,V(i)+k32*h);
    end
    %Use RK to calculate next x, V, and t values
    x(i+1) = x(i) + 1/6 * (k11+2*k21+2*k31+k41)*h;
    V(i+1) = V(i) + 1/6 * (k12+2*k22+2*k32+k42)*h;
    t(i+1) = t(i) + h;

    if (V(i+1) <= 0)    %if the velocity reaches zero, end the loop
        break
    end
    
    i = i+1;    %increment variable
end
t = t(end);
x = x(end);
V = V(end);
end

