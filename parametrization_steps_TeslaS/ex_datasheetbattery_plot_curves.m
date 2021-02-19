%% Plot curves
figure(3)
hold on
box on
for i=1:10:length(SOC_LUT)
    plot(sort_current,Em_MAT(i,sort_index_current))%colorV{i},'Marker','o','MarkerFaceColor',colorF{i})
end
xlabel('Current [A]')
ylabel('Voltage [V]')
legend(num2str(SOC_LUT(1:10:end)),'Location','eastoutside')
title('Curve fitting,Voltage vs Discharge current at different SOC')