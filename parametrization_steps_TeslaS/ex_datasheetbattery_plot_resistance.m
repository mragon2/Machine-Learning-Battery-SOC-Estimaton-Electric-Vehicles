% Plot battery resistance at different temperatures

figure(5)
plot(SOC_LUT,R0_LUT)
%legend(temperature_label{ref_curr & ~val_exp},'Location','eastoutside');
legend(temperature_label{ref_curr},'Location','eastoutside');
xlabel('1-SOC'); xlim([0 1]); ylabel('Internal Resistance [\Omega]');
%title('Internal Resistance at constant C=1 and different Temperatures');