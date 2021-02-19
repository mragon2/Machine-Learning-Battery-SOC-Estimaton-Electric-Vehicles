% the reference current is 1C (second dataset in the datastructure)
% the reference temperature is 293K (second dataset in the datastructure)
ref_exp = 2;

val_exp = logical([0 1 0 1 1]);

ref_curr = current == current(ref_exp);
ref_temp = temperature == temperature(ref_exp);

[sort_current, sort_index_current] = sort(current(ref_temp));
[sort_temp, sort_index_temp] = sort(temperature(ref_curr));
N = length(current); % Number of experiments

for i=1:N
    x.(['curr' current_label{i} '_temp' temperature_label{i}]) = ...
            data_NL.([label '_' current_label{i} '_' temperature_label{i}])(:,1)/...
            data_NL.([label '_' current_label{i} '_' temperature_label{i}])(end,1);
    % Calculate actual capacity for each datasheet
    correct_cap.(['curr' current_label{i} '_temp' temperature_label{i}]) = ...
            data_NL.([label '_' current_label{i} '_' temperature_label{i}])(end,1);    
end

run('ex_datasheetbattery_plot_soc.m')