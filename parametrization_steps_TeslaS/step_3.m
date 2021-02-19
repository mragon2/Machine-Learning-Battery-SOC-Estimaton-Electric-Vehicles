%SOC_LUT = (0:.01:1)';
SOC_LUT = (0:.01:1)';
%SOCbkpts = 0:.2:1;
SOCbkpts = 0:.2:1;

for i=find(ref_temp)
    fitObj.(['fit' current_label{i}]) = ...
        fit(x.(['curr' current_label{i} '_temp' temperature_label{i}]),...
         data_100KWh_1cycle.([label '_' current_label{i} '_' temperature_label{ref_exp_temp}])(:,2),'smoothingspline');
end

for i=find(ref_curr)
    fitObj.(['fit' temperature_label{i}]) = ...
        fit(x.(['curr' current_label{i} '_temp' temperature_label{i}]),...
        data_100KWh_1cycle.([label '_' current_label{ref_exp_curr} '_' temperature_label{i}])(:,2),'smoothingspline');
end

Em_MAT = [];
for i=find(ref_temp)
    Em_MAT = [Em_MAT fitObj.(['fit' current_label{i}])(SOC_LUT)];
end

run('ex_datasheetbattery_plot_curves.m')
