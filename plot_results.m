% This script plots the time series of the current, voltage and SOC for a
% single cell and the entire battery pack.


figure(6)
plot(Battery_I(:,1),Battery_I(:,2),'k');
xlim([0 600])
xlabel('Time[s]')
ylabel('Current[A]')

figure(7)
plot(Battery_I_cell(:,1),Battery_I_cell(:,2),'k');
xlim([0 600])
xlabel('Time[s]')
ylabel('Cell Current[A]')


figure(8)
plot(Battery_V_cell_simulink(:,1),Battery_V_cell_simulink(:,2));
xlim([0 600])
xlabel('Time[s]')
ylabel('Cell Voltage[V]')

figure(9)
plot(Battery_V_simulink(:,1),Battery_V_simulink(:,2));
xlim([0 600])
xlabel('Time[s]')
ylabel('Pack Voltage[V]')


figure(10)
plot(Battery_SOC_cell_simulink(:,1),Battery_SOC_cell_simulink(:,2),'r');
xlim([0 600])
xlabel('Time[s]')
ylabel('Cell SOC[%]')
