%% Plot battery fit

clear R I V T
val_exp = logical([1 1 1 1 1 1 1]);
T = temperature(val_exp); % ºC
I = current(val_exp); % A
for i=1:length(nonzeros(val_exp))
      [row, col] = meshgrid(1000./(273+T(i)),SOC_LUT);
      R(:,i) = exp(R0_vs_T_SOC_fit(row,col));
      V(:,i) = Em - I(i).*R(:,i);
end


f9 = figure(9);
clf
hold on
clear leg
valIdx = find(val_exp);
colorV = repmat({'k' 'r' 'b' 'g'},1,10);
for i=1:length(nonzeros(val_exp))
    p9 = plot(SOC_LUT, V(:,i));
    leg{2*i-1}=['calc_' 'curr' current_label{valIdx(i)} '_temp' temperature_label{valIdx(i)}];
    p9.Color = colorV{i};
    p10 = plot(x.(['curr' current_label{valIdx(i)} '_temp' temperature_label{valIdx(i)}]), ...
            data_100KWh_1cycle.([label '_' current_label{valIdx(i)} '_' temperature_label{valIdx(i)}])(:,2),'.');
    p10.Color = colorV{i};
    leg{2*i}=['exper_' 'curr' current_label{valIdx(i)} '_temp' temperature_label{valIdx(i)}];
end
plot(SOC_LUT, Em, 'm');
leg{length(leg)+1} = 'Em';
xlim([0 1]); xlabel('1-SOC'); ylabel('Voltage [V]');
legend(leg,'Interpreter','none','Location','EastOutside')
title(['Figure 9 - Validation of Battery Model Fit' sprintf('\n\n') 'Validation'])