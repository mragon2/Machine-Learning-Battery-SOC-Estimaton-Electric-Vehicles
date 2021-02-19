run('ex_datasheetbattery_plot_voltage.m')

R0_LUT = [];
%for i=find(ref_curr & ~val_exp)
for i=find(ref_curr)
    % Create fit object for V vs. SOC
    voltVsSOC.(['temp' temperature_label{i}]) = fitObj.(['fit' temperature_label{i}])(SOC_LUT);
    % Calculate R0(SOC,T) assuming linear behavior R0 = DeltaV / I
    R0.(['temp' temperature_label{i}]) = (Em - voltVsSOC.(['temp' temperature_label{i}]))./current(ref_exp);
    % Construct LUT
    R0_LUT = [R0_LUT R0.(['temp' temperature_label{i}])];
end

if ~isempty(find(SOC_LUT==0.9, 1))
    R0_LUT(SOC_LUT>0.9,:) = repmat(R0_LUT(SOC_LUT == 0.9,:),length(R0_LUT(SOC_LUT>0.9,:)),1);
else
    [closestTo0p9, locClosestTo0p9] = min(abs(SOC_LUT-0.9));
    R0_LUT(SOC_LUT>closestTo0p9,:) = repmat(R0_LUT(locClosestTo0p9,:),...
                                     length(R0_LUT(SOC_LUT>closestTo0p9,:)),1);
end

R0_LUT = max(R0_LUT,0);
%T_LUT = 273.15 + temperature(ref_curr & ~val_exp);
T_LUT = 273.15 + temperature(ref_curr);
[T_LUT1,idx] = sort(T_LUT);
xtmp=R0_LUT';
R0_LUT1(1:length(T_LUT),:) = xtmp(idx,:);


R0_LUT_bkpts = [];
counter = 1;
%for i=find(ref_curr & ~val_exp)
for i=find(ref_curr)
    R0_LUT_bkpts = [R0_LUT_bkpts R0_LUT(idx',counter)];
    counter = counter+1;
end


ex_datasheetbattery_plot_resistance