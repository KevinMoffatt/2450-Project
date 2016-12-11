% Josh Call  Justin Lord  Kevin Moffatt
% ME 2450 Final Design Project
% 12/14/16
clc, clear, close all

%% Set Up Possible Parameters

%Lt = 1.5 *.3048;    %Length of model train (from ft to m)
Lt = [.1:.01:1.5]; %Length of model train (in m)
%D = 4 * .0254;      %Diameter of model train (from in to m)
D0 = [.04:.001:.25]; %Diameter of model train (in to m)
%m = 2;              %Mass of train (in kg)
pt = [1400, 2700, 7700]; %Density of train material (PVC, Aluminum - 6061, galvanized steel)
%A = 15.9 *(.0254)^2;%Frontal area of train (from in^2 to m^2)
Pgage = [1:.5:100] * 6894.76;     %Initial tank pressure (from psig to Pa) - note: does not factor in atmospheric pressure, becuase when factored in it always cuases slip
Patm = 12.6 * 6894.76;  %Atmospheric pressure in Salt Lake City (psi to Pa)
P0 = Pgage + Patm;  %Initial total pressure in the tank (Pa)
Dw = 2.25 * .0254;  %Wheel diameter (in to m)
rw = Dw/2;   %Wheel radius (inches to m)
rg = [.01:.001:rw];   %Pinion gear radius (m)
Lr = linspace(.01,1.5,92);     %Piston stroke length (m)
Lp = 2 * Lr;        %Length of piston (m)
Dp = [5/16:1/16:6] * .0254;   %Piston diameter (in to m)

rho = 1.067;        %Air density (kg/m^3)
Cd = 0.8;             %Drag coefficient
Cr = .028992;           %Rolling friction coefficient
us = .5;            %Coefficient of static friction
mw = .1;            %Wheel mass (kg)
g = 9.81;           %Acceleration due to gravity in m/s^2

Di = D0/1.3;        %Inside diameter of the pressure tank pipe (m)
Mp = 1250*((pi/4) * Dp.^2 .* Lp); %Mass of the pneumatic piston
