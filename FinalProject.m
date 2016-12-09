% Josh Call  Justin Lord  Kevin Moffatt
% ME 2450 Final Design Project
% 12/14/16
clc, clear, close all

%% Set Up Possible Parameters

Lt = 1.5 *.3048;    %Length of model train (from ft to m)
D = 4 * .0254;      %Diameter of model train (from in to m)
m = 2;              %Mass of train (in kg)
A = 15.9 *(.0254)^2;%Frontal area of train (from in^2 to m^2)
rho = 1;            %Air density (kg/m^3)
Cd = 1;             %Drag coefficient
Cr = .03;           %Rolling friction coefficient
us = .5;            %Coefficient of static friction
P0 = 8.5 * 6894;     %Initial tank pressure (from psig to pa) - note: does not factor in atmospheric pressure, becuase when factored in it always cuases slip
rp = 3/8 * .0254;   %Pinion gear radius (inches to m)
rw = 2.5 * .0254;   %Wheel radius (inches to m)
mw = .1;            %Wheel mass (kg)
Dp = 1.5 * .0254;   %Piston diameter (in to m)
Lr = 3 * .0254;     %Piston stroke length (in to m)
g = 9.81;           %Acceleration due to gravity in m/s^2