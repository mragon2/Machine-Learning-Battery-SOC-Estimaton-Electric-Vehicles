%% Plot surface fit
figure(7)
plot(R0_vs_T_SOC_fit,[xx,yy],zz)
xlabel('1000/T [1/K]'); ylabel('SOC'); zlabel('ln(R) [\Omega]')
title(['Figure 7 - Surface Fit of Battery Resistance' sprintf('\n\n') 'ln(Battery Resistance) as a Function of SOC and Temperature'])

%% Plot surface fit
figure(8)
plot(R0_vs_T_SOC_fit1,[xx1,yy1],zz1)
xlabel('Temperature [K]'); ylabel('SOC'); zlabel('Resistance [\Omega]')
title(['Figure 8 - Surface Fit of Battery Resistance' sprintf('\n\n') 'Battery Resistance as a Function of SOC and Temperature'])

% Validation. Given T, calculate R
% Enter T and SOC as column vectors
clear R I V T
val_exp = logical([1 0 0 0 1 0 0 0 0 1 1]);
T = temperature(val_exp); % ºC
I = current(val_exp); % A
for i=1:length(nonzeros(val_exp))
      [row, col] = meshgrid(1000./(273+T(i)),SOC_LUT);
      R(:,i) = exp(R0_vs_T_SOC_fit(row,col));
      V(:,i) = Em - I(i).*R(:,i);
end