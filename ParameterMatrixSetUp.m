function [ ParameterMatrix ] = ParameterMatrixSetUp( Lt,Do,pt,P0,rg,Lr,Dp,pa,Patm,Cd,Cr,muS,Dw,mw )
%ParameterMatrixSetUp takes in a list of parameters with values, and creates a matrix
%of all possible combinations

%initialize parameter matrix:
%number of rows is equal to the amount of each parameter multiplied by the
%amount of every other parameter - gives number of possible combinations
numRows = length(Lt)*length(Do)*length(pt)*length(P0)*length(rg)*length(Lr)*length(Dp)*length(pa)*length(Patm)*length(Cd)*length(Cr)*length*(muS)*length(Dw)*length(mw);
numCols = nargin;       %number of columns is equal to the number of input arguments (number of parameters)
ParameterMatrix = zeros(numRows,numCols);   %prelocates for speed




end

