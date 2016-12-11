%Kevin Moffatt
%Test Parameter Matrix Set Up function

clc,clear,close all

%Lt = 1.5 *.3048;    %Length of model train (from ft to m)
Lt = [.5:.5:1.5]; %Length of model train (in m)
%D = 4 * .0254;      %Diameter of model train (from in to m)
Do = [.05:.05:.25]; %Outer diameter of model train (m)
%m = 2;              %Mass of train (in kg)
pt = [1400, 2700, 7700]; %Density of train material (PVC, Aluminum - 6061, galvanized steel)
%A = 15.9 *(.0254)^2;%Frontal area of train (from in^2 to m^2)
Pgage = [1:10:30] * 6894.76;     %Initial tank pressure (from psig to Pa)
Patm = 12.6 * 6894.76;  %Atmospheric pressure in Salt Lake City (psi to Pa)
P0 = Pgage + Patm;  %Initial total pressure in the tank (Pa)
Dw = 2.25 * .0254;  %Wheel diameter (in to m)
rw = Dw/2;   %Wheel radius (inches to m)
%rg = [.01:.02:rw];   %Pinion gear radius (m)
rg = linspace(.01,rw,3);  %Pinion gear radius (m)
Lr = [.5:.5:1.5];     %Piston stroke length (m)
Lp = 2 * Lr;        %Length of piston (m)
%Dp = [5/16:1/16:6] * .0254;   %Piston diameter (in to m)
Dp = [1:3:9] * .0254;   %Piston diameter (in to m)

pa = 1.067;        %Air density (kg/m^3)
Cd = 0.8;             %Drag coefficient
Cr = .028992;           %Rolling friction coefficient
muS = .5;            %Coefficient of static friction
mw = .1;            %Wheel mass (kg)
g = 9.81;           %Acceleration due to gravity in m/s^2

%Test Parameter Matrix Set Up Function
ParameterMatrix = ParameterMatrixSetUp(Lt,Do,pt,P0,rg,Lr,Dp,pa,Patm,Cd,Cr,muS,Dw,mw);