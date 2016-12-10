function [ OptimalSet ] = TrainOptimization( ParameterMatrix )
%TrainOptimization takes a matrix of all the possible combinations of
%variables and calculates the fastest combination that adheres to the rules

[rows,cols] = size(ParameterMatrix);    %finds size of parameter matrix

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
    

    %Calculate wheel slip conditions: occurs if Ft > us*m*g
    x = 0;  %check at begining when x = 0 - when max Ft occurs
    V = 0;  %inital velocity, going to be 0, starts at rest
    rw = Dw/2;  %wheel radius is half the wheel diameter
    Vol0 = pi/4 * D^2 * Lt;  %volume of tank
    a = (m + mw/2)^(-1) * (rp*Ap/rw * (P0*Vol0/(Vol0+Ap*rp/rw*(x)))...
        -1/2*Cd*rho*A*(V)^2 - Cr*m*g);  %formula for acceleration
    Ft = rp*Ap/rw * (P0*Vol0/(Vol0+Ap*rp/rw*x)) - mw/2 * a; %formula for thrust force
    if Ft > us*m*g
        continue;   %if wheel slip will occur, skip running RK4 to save 
        %computation time - this will not be a possible final combination of parameters
    end
    
    %Calculate additional variables needed for RK4
    A = 2*pi*(Do/2)^2;  %assume half sphere front cap - SA = 2*pi*r^2
    
    m = pt*Lt + pa*Vol0 + mw;   %mass of train is the density of material multiplied by 
    %Put all paramters in vector to pass to RK4
    p = [m,mw,Do,Lt,rho,Cd,Cr,Lr,g,rp,rw,P0,Dp,A];

end
end

