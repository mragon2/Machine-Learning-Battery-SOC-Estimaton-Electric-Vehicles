cd('discharge_curves/All_C-293K');
% different C, T const
z2C_293K_1Cycle_Ah=load('0_2C-293K_1Cycle_Ah.dat');
oneC_293K_1Cycle_Ah=load('1C-293K_1Cycle_Ah.dat');
twoC_293K_1Cycle_Ah=load('2C-293K_1Cycle_Ah.dat');
fourC_293K_1Cycle_Ah=load('4C-293K_1Cycle_Ah.dat');

cd ..
% C const, different T
cd('All_C-243K');
oneC_243K_1Cycle_Ah=load('1C-243K_1Cycle_Ah.dat');
cd ..
cd('All_C-253K');
oneC_253K_1Cycle_Ah=load('1C-253K_1Cycle_Ah.dat');
cd ..
cd ('All_C-333K');
oneC_333K_1Cycle_Ah=load('1C-333K_1Cycle_Ah.dat');


cd ..
cd ..


data_NL=struct('NL_02C_293K',z2C_293K_1Cycle_Ah,'NL_1C_293K',oneC_293K_1Cycle_Ah,'NL_2C_293K',twoC_293K_1Cycle_Ah, 'NL_4C_293K',fourC_293K_1Cycle_Ah,'NL_1C_243K',oneC_243K_1Cycle_Ah,'NL_1C_253K',oneC_253K_1Cycle_Ah,'NL_1C_333K',oneC_333K_1Cycle_Ah)

figure(1)
hold on
box on
plot(oneC_243K_1Cycle_Ah(:,1),oneC_243K_1Cycle_Ah(:,2));
plot(oneC_253K_1Cycle_Ah(:,1),oneC_253K_1Cycle_Ah(:,2));
plot(oneC_293K_1Cycle_Ah(:,1),oneC_293K_1Cycle_Ah(:,2));
plot(oneC_333K_1Cycle_Ah(:,1),oneC_333K_1Cycle_Ah(:,2));
xlabel('Ah')
ylabel('Voltage')
legend('243K','253K','293K','333K');


figure(2)
hold on
box on
plot(oneC_243K_1Cycle_Ah(:,1)/max(oneC_243K_1Cycle_Ah(:,1)),oneC_243K_1Cycle_Ah(:,2));
plot(oneC_293K_1Cycle_Ah(:,1)/max(oneC_293K_1Cycle_Ah(:,1)),oneC_293K_1Cycle_Ah(:,2));
plot(oneC_333K_1Cycle_Ah(:,1)/max(oneC_333K_1Cycle_Ah(:,1)),oneC_333K_1Cycle_Ah(:,2));
xlabel('1-SOC')
ylabel('Voltage')
legend('243K','293K','333K');