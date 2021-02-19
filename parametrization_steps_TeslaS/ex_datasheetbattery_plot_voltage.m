% Plot discharge curves at different temperatures 
figure(4)
hold on
box on
for i=find(ref_curr)
    plot(x.(['curr' current_label{i} '_temp' temperature_label{i}]), ...
        data_100KWh_1cycle.([label '_' current_label{ref_exp_curr} '_' temperature_label{i}])(:,2));
end
legend(temperature_label(find(ref_curr)),'Location','eastoutside');
xlabel('1-SOC'); xlim([0 1]); ylabel('Voltage [V]'); title([batt_id ' ' current_label{ref_exp_curr}]);
%title(['Figure 4 - Battery Voltage' sprintf('\n\n') 'Battery Voltage at Different Temperatures Under Constant Load']);
title('Voltage vs SOC at constant C=1 and different Temperatures')