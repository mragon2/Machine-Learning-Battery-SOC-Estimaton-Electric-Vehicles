% the reference current is 1C (second dataset in the datastructure)
ref_exp_curr = 2;

ref_curr = current == current(ref_exp_curr);

% the reference temperature is 293K (number 2 5,6,7 dataset in the datastructure)
ref_exp_temp=2;
ref_temp = temperature == temperature(ref_exp_temp);

% there are 8 datasets in the data structure
% 0: estimation
% 1: validation
% 0.2 C 293K >>> validation
% 4 C 293K >>> validation
% 1 C 243K >>> validation
% 1 C 333K >>> validation
val_exp = logical([0 0 0 0 0 0 0]);

[sort_current, sort_index_current] = sort(current(ref_temp));
[sort_temp, sort_index_temp] = sort(temperature(ref_curr));
N = length(current); % Number of experiments

for i=1:N
    x.(['curr' current_label{i} '_temp' temperature_label{i}]) = ...
            data_100KWh_1cycle.([label '_' current_label{i} '_' temperature_label{i}])(:,1)/...
            data_100KWh_1cycle.([label '_' current_label{i} '_' temperature_label{i}])(end,1);
    % Calculate actual capacity for each datasheet
    correct_cap.(['curr' current_label{i} '_temp' temperature_label{i}]) = ...
            data_100KWh_1cycle.([label '_' current_label{i} '_' temperature_label{i}])(end,1);    
end

run('ex_datasheetbattery_plot_soc.m')