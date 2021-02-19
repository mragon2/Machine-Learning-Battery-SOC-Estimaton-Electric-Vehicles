%% Plot the discharge and temperature curves
% Define RGB pairs
purple = [51 0 102]/256;
orange = [256 128 0]/256;
indigo = [75 0 130]/256;
%
% Battery information is summarized below and is aligned with line colors.
% Note that the constant temperature curves end at index 5
batt_id = 'Lithium Ion C_LMO Nissan Leaf';
label = 'NL';
current_label = {'02C','1C','2C','4C','1C','1C','1C'};
I_nom=55.95;
current = [I_nom*0.2 I_nom*1 I_nom*2  I_nom*4 I_nom*1 I_nom*1 I_nom*1];
temperature_label = {'293K','293K','293K','293K','243K','253K','333K'};
temperature = [20 20 20 20 -30 -20 60];
line_colors = {'r','k','b','c'};
% markerType1 = {'none', 'o', 'none', 'none', 'none'};
markerType1 = {'none', 'none', 'none','none', 'none', 'none','none'};

figure(1);
subplot(2,1,1);hold on;
box on;
for j=1:4
data = ['NL_' current_label{j} '_' temperature_label{j}];
plot(data_NL.(data)(:,1),data_NL.(data)(:,2),'color',line_colors{j},'Marker',markerType1{j});
end
title(['Figure 1 - Data Import' sprintf('\n\n') 'Discharge Characteristics at Constant T=293K']);
xlabel('Discharge Capacity [Ah]')
ylabel('Voltage [V]');
legend({'0.2C','1.0C','2.0C','4C'},'Location','EastOutside')
hold off;

line_colors = {'b','r','g','c','c','k','m'};
subplot(2,1,2);hold on;
box on
for j=[2 5:7]
%for j=4:5'
%data = evalin('base',['LiIon_' current_label{j} '_' temperature_label{j}]);
data = ['NL_' current_label{j} '_' temperature_label{j}];
plot(data_NL.(data)(:,1),data_NL.(data)(:,2),'color',line_colors{j},'Marker',markerType1{j});
end
title('Temperature Characteristics at Constant C=1');
xlabel('Discharge Capacity [Ah]')
ylabel('Voltage [V]');
legend({'293','243','253','333'},'Location','EastOutside')
hold off;