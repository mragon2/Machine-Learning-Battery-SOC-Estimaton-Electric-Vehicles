R0_refTemp = [];
for i=1:length(SOC_LUT)
    % Fit a line to V=f(I)
    fitSOC.(['SOC' num2str(i)]) = fit(sort_current',Em_MAT(i,sort_index_current)','poly2');
end

Em = [];
for i=1:length(SOC_LUT)
    % Em = f(0)
    Em = [Em fitSOC.(['SOC' num2str(i)])(0)];
end
%Em = Em(end:-1:1)
Em=Em';