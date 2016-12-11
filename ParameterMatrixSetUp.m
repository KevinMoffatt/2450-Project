function [ ParameterMatrix ] = ParameterMatrixSetUp( Lt,Do,pt,P0,rg,Lr,Dp,deadWeight,pa,Patm,Cd,Cr,muS,Dw,mw )
%ParameterMatrixSetUp takes in a list of parameters with values, and creates a matrix
%of all possible combinations

%initialize parameter matrix:
%number of rows is equal to the amount of each parameter multiplied by the
%amount of every other parameter - gives number of possible combinations
numRows = length(Lt)*length(Do)*length(pt)*length(P0)*length(rg)*length(Lr)*length(Dp)*length(deadWeight)*length(pa)*length(Patm)*length(Cd)*length(Cr)*length(muS)*length(Dw)*length(mw);
numCols = nargin;       %number of columns is equal to the number of input arguments (number of parameters)
ParameterMatrix = zeros(numRows,numCols);   %preallocates for speed


row = 0;    %initialize row variable
%loops through each parameter and each possible combination
for i = 1:length(Lt)
    for j = 1:length(Do)
        for k = 1:length(pt)
            for l = 1:length(P0)
                for m = 1:length(rg)
                    for n = 1:length(Lr)
                        for o = 1:length(Dp)
                            for z = 1:length(deadWeight)
                                for p = 1:length(pa)
                                    for q = 1:length(Patm)
                                        for r = 1:length(Cd)
                                            for s = 1:length(Cr)
                                                for t = 1:length(muS)
                                                    for u = 1:length(Dw)
                                                        for v = 1:length(mw)
                                                            row = row+1;    %increments row
                                                            ParameterMatrix(row,15) = mw(v);     %creates row of all current combination configuration
                                                            ParameterMatrix(row,14) = Dw(u);
                                                            ParameterMatrix(row,13) = muS(t);
                                                            ParameterMatrix(row,12) = Cr(s);
                                                            ParameterMatrix(row,11) = Cd(r);
                                                            ParameterMatrix(row,10) = Patm(q);
                                                            ParameterMatrix(row,9) = pa(p);
                                                            ParameterMatrix(row,8) = deadWeight(z);
                                                            ParameterMatrix(row,7) = Dp(o);
                                                            ParameterMatrix(row,6) = Lr(n);
                                                            ParameterMatrix(row,5) = rg(m);
                                                            ParameterMatrix(row,4) = P0(l);
                                                            ParameterMatrix(row,3) = pt(k);
                                                            ParameterMatrix(row,2) = Do(j);
                                                            ParameterMatrix(row,1) = Lt(i);
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end



end

