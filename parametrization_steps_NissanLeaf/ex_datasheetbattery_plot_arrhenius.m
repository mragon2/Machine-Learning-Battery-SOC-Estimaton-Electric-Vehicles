%% Plot Arrhenius behavior
figure(6)
clf
hold on
clear idx leg;
for k=1:length(SOCbkpts)
    idx(k) = find(abs(SOC_LUT-SOCbkpts(k))<0.001);
    scatter(1000./T_LUT , log(R0_LUT(idx(k),:)),'MarkerFaceColor',line_colors{k});
    leg{k}=['SOC = ' num2str(SOCbkpts(k))];
end

for k=1:length(SOCbkpts)
    leg{k+length(SOCbkpts)}=['SOC = ' num2str(SOCbkpts(k))];
    R0_vs_T_fit = fit(1000./T_LUT' , log(R0_LUT(idx(k),:))','poly1');
    plot(1000./T_LUT',R0_vs_T_fit(1000./T_LUT'),'color',line_colors{k})
    Ea(k) = 8.314 * R0_vs_T_fit.p1;
end

xlabel('1000/T [1/K]')
ylabel('ln(R_0) [\Omega]')
title(['Figure 6 - Arrhenius Behavior' sprintf('\n\n') 'Arrhenius plot of R_0 vs. 1000/T'])
legend(leg,'Location','northwest')

% Display results.
disp(' ');
disp('Activation energy for Li ion conduction');
disp(['Ea = ' num2str(Ea) ' kJ/mol']);
disp('Ea for electrolyte transport in Li ion battery = 20 kJ/mol');