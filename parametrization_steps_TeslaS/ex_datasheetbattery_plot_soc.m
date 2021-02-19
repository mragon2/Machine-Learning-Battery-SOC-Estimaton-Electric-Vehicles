%% Normalized SOC Data
figure(2);
count = 1;
hold on
box on
for i=find(ref_temp)
%for i=1:length(current)
    p1 = plot(x.(['curr' current_label{i} '_temp' temperature_label{i}]),data_100KWh_1cycle.([label '_' current_label{i} '_' temperature_label{ref_exp_temp}])(:,2));
    %leg{count}=['I = ' num2str(current(i)) ' A'];
    count = count+1;
end
legend('C=02','C=1','C=2','C=4','Location','EastOutside');
 %legend(leg,'Location','EastOutside');
xlabel('1-SOC'); xlim([0 1]); ylabel('Voltage [V]'); 
title('SOC at constant T=293K')
%title(['Figure 2 - Normalized SOC Data' sprintf('\n\n') batt_id ' ' temperature_label{ref_exp}]);
% p2.XLabel.String = 'Ah'; p2.XLim = [0 110]; p2.YLabel.String = 'Voltage [V]'; p2.Title.String = ([batt_id ' ' temperature_label{ref_exp}]);