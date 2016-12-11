function [ OptimalSet ] = TrainOptimization( ParameterMatrix )
%TrainOptimization takes a matrix of all the possible combinations of
%variables and calculates the fastest combination that adheres to the rules

[rows,~] = size(ParameterMatrix);    %finds size of parameter matrix
timeMin = 100;      %sets minimum time to 100 seconds
h = .01;    %best step size according to lab 11
x0 = 0;     %inital conditions for RK4
v0 = 0;

for i = 1:rows
    %extract each variable from the current combination in the parameter
    %matrix
    Lt = ParameterMatrix(i,1);
    Do = ParameterMatrix(i,2);
    pt = ParameterMatrix(i,3);
    P0 = ParameterMatrix(i,4);
    rg = ParameterMatrix(i,5);
    Lr = ParameterMatrix(i,6);
    Dp = ParameterMatrix(i,7);
    pa = ParameterMatrix(i,8);
    Patm = ParameterMatrix(i,9);
    Cd = ParameterMatrix(i,10);
    Cr = ParameterMatrix(i,11);
    muS = ParameterMatrix(i,12);
    Dw = ParameterMatrix(i,13);
    mw = ParameterMatrix(i,14);
    
    
        %Calculate additional variables needed for RK4
    A = 2*pi*(Do/2)^2;  %assume half sphere front cap - SA = 2*pi*r^2
    volTrain = pi/4*Lt*(Do^2 - Di^2) + pi/6*(Do^3 - Di^3);   %volume of the train components - assume hollow cylinder with two half sphere end caps
    m = pt*volTrain + pa*Vol0 + mw;   %mass of train is the density of material multiplied by 
    g = 9.81;   %acceleration due to gravity (9.81 m/s)

    %Calculate wheel slip conditions: occurs if Ft > us*m*g
    x = 0;  %check at begining when x = 0 - when max Ft occurs
    V = 0;  %inital velocity, going to be 0, starts at rest
    rw = Dw/2;  %wheel radius is half the wheel diameter
    Di = Do/1.3;    %inside diameter of tube used for train
    Vol0 = pi/4 * Di^2 * Lt;  %volume of tank
    a = (m + mw/2)^(-1) * (rp*Ap/rw * (P0*Vol0/(Vol0+Ap*rp/rw*(x)))...
        -1/2*Cd*pa*A*(V)^2 - Cr*m*g);  %formula for acceleration
    Ft = rp*Ap/rw * (P0*Vol0/(Vol0+Ap*rp/rw*x)) - mw/2 * a; %formula for thrust force
    if Ft > muS*m*g
        continue;   %if wheel slip will occur, skip running RK4 to save 
        %computation time - this will not be a possible final combination of parameters
    end
   
    
    %Put all paramters in vector to pass to RK4
    p = [m,mw,Do,Lt,pa,Cd,Cr,Lr,g,rg,rw,P0,Dp,A,Patm];
    
    %Run RK4
    [t,x,V] = RK4_race(h,x0,V0,p);
    if ((x < 14) && (x > 12)) && (t(end) < timeMin)     %if the train stops in the required distance (in between 12 and 14 m from start) and the time is less than the 
        %previous minimum time then set optimal values to current set
        timeMin = t(end);   %set minimum time to current end time
        tOptimal = t;   %set optimal values to current values and parameters
        xOptimal = x;
        VOptimal = V;
        paramOptimal = ParameterMatrix(i,:);
        OptimalSet = [tOptimal xOptimal VOptimal paramOptimal]; %stores optimal vectors into optimal matrix
    end

end
end

