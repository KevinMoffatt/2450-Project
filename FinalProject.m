% Josh Call  Justin Lord  Kevin Moffatt
% ME 2450 Final Design Project
% 12/14/16
clc, clear, close all

tic;    %start timer
%% Set Up Possible Parameters

%Lt = 1.5 *.3048;    %Length of model train (from ft to m)
%Lt = [.1:.01:1.5]; %Length of model train (in m)
Lt = linspace(.1,1.5,10); %Length of model train (in m)
%D = 4 * .0254;      %Diameter of model train (from in to m)
Do = [.05:.05:.25]; %Diameter of model train (in to m)
%m = 2;              %Mass of train (in kg)
pt = [1400, 2700, 7700]; %Density of train material (PVC, Aluminum - 6061, galvanized steel)
%A = 15.9 *(.0254)^2;%Frontal area of train (from in^2 to m^2)
Pgage = [1:2:30] * 6894.76;     %Initial tank pressure (from psig to Pa) - note: does not factor in atmospheric pressure, becuase when factored in it always cuases slip
Patm = 12.6 * 6894.76;  %Atmospheric pressure in Salt Lake City (psi to Pa)
P0 = Pgage + Patm;  %Initial total pressure in the tank (Pa)
Dw = 2.25 * .0254;  %Wheel diameter (in to m)
rw = Dw/2;   %Wheel radius (inches to m)
%rg = [.01:.001:rw];   %Pinion gear radius (m)
rg = linspace(.01,rw,8);     %Pinion gear radius (m)
Lr = linspace(.1,1.5,8);     %Piston stroke length (m)
Lp = 2 * Lr;        %Length of piston (m)
%Dp = [5/16:1/16:6] * .0254;   %Piston diameter (in to m)
Dp = [2:9] * .0254;   %Piston diameter (in to m)
deadWeight = [0:.5:3];    %added deadweight to train

pa = 1.067;        %Air density (kg/m^3)
Cd = 0.8;             %Drag coefficient
Cr = .028992;           %Rolling friction coefficient
muS = .5;            %Coefficient of static friction
mw = .1;            %Wheel mass (kg)
g = 9.81;           %Acceleration due to gravity in m/s^2



%Test Parameter Matrix Set Up
ParameterMatrix = ParameterMatrixSetUp( Lt,Do,pt,P0,rg,Lr,Dp,deadWeight,pa,Patm,Cd,Cr,muS,Dw,mw );

%Not sure if this is necessary here:
Di = Do/1.3;        %Inside diameter of the pressure tank pipe (m)
%Mp = 1250*((pi/4) * Dp.^2 .* Lp); %Mass of the pneumatic piston

%NEXT STEPS: TEST TRAIN OPTIMIZATION FUNCTION
OptimalSet = TrainOptimization(ParameterMatrix);
%I tried to run this but it was taking too long.  Might need to work on
%making less parameters, or find a better way to run this code.  Overall
%the next stesp are to get this function to work, and then displaying the
%data we get from the Optimal Set matrix.


%Calculate and print run time:
runTime = toc; %end timer
fprintf('Run time is %f seconds\n',runTime);