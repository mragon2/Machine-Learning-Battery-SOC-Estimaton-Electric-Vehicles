% This script saves the data computed by the EV simulink model. The data
% are the time series of the electrical and mechanical variables
% characterizing the dynamic behavior of the EV. The variables are the SOC,
% battery current, voltage, temperature, but also the electric motor
% power/energy, power/energy losses, the breaking power/energy of the
% breaking system, the wheels friction power/energy losses and the air
% resistance power/energy losses. All these variable are saved separately
% and then combined into a single dataset. We create two datasets, one
% for the power time series and one for the energy time series.

% For example, If we run Tesla S model with FTP75 driving cycle, the
% datasets will be saved in csv files in the directory
% 'results_TeslaS/FTP75' created by the script, in the csv files
% 'dataset_Pwr.csv' and 'dataset_Pwr.csv'

% In addition, we save separately a txt file which contains the time series
% of the discharging current. This txt file will be given in input the 3D
% Comsol Model to study the thermal effects and the degradation induced by SEI
% formation/decomposition.

%sim('PTB_BatteryElectricVehicle.slx');

time_original=data_Battery_Curr.Time;

filter_step=round(length(time_original)/max(time_original));

time=round(time_original(1:filter_step:end));



%%  Battery

Battery_I_cell=data_Battery_Curr.Data/Np;
Battery_I_cell=[time';Battery_I_cell(1:filter_step:end)']';

Battery_I=data_Battery_Curr.Data;
Battery_I=[time';Battery_I(1:filter_step:end)']';

Battery_V_cell_simulink=data_Battery_Volt.Data/Ns;
Battery_V_cell_simulink=[time';Battery_V_cell_simulink(1:filter_step:end)']';

Battery_V_simulink=data_Battery_Volt.Data;
Battery_V_simulink=[time';Battery_V_simulink(1:filter_step:end)']';

Battery_SOC_cell_simulink=data_Battery_SOC_cell.Data;
Battery_SOC_cell_simulink=[time';Battery_SOC_cell_simulink(1:filter_step:end)']';

Battery_Temperature=data_Battery_Temperature.Data;
Battery_Temperature=[time';Battery_Temperature(1:filter_step:end)']';


dataset_Battery=[Battery_SOC_cell_simulink(:,2), Battery_I(:,2),Battery_V_simulink(:,2),Battery_Temperature(:,2)];

mkdir results_TeslaS/FTP75/;
save('results_TeslaS/FTP75/I_cell.txt','Battery_I_cell','-ascii');

%% MAPPED MOTOR BLOCK

Motor_PwrMtr=data_Motor_PwrMtr.Data;
Motor_PwrMtr=[time';Motor_PwrMtr(1:filter_step:end)']';

Motor_EnrgMtr=data_Motor_EnrgMtr.Data;
Motor_EnrgMtr=[time';Motor_EnrgMtr(1:filter_step:end)']';


Motor_PwrLoss=data_Motor_PwrLoss.Data;
Motor_PwrLoss=[time';Motor_PwrLoss(1:filter_step:end)']';

Motor_EnrgLoss=data_Motor_EnrgLoss.Data;
Motor_EnrgLoss=[time';Motor_EnrgLoss(1:filter_step:end)']';

dataset_Motor_Pwr=[Motor_PwrMtr(:,2),Motor_PwrLoss(:,2)];   
dataset_Motor_Enrg=[Motor_EnrgMtr(:,2),Motor_EnrgLoss(:,2)]; 
%%  REAR DIFFERENTIAL


Diff_PwrMechLoss=data_Diff_PwrMechLoss.Data;
Diff_PwrMechLoss=[time';Diff_PwrMechLoss(1:filter_step:end)']';

Diff_EnrgMechLoss=data_Diff_EnrgMechLoss.Data;
Diff_EnrgMechLoss=[time';Diff_EnrgMechLoss(1:filter_step:end)']';

dataset_Diff_Pwr=[Diff_PwrMechLoss(:,2)];   
dataset_Diff_Enrg=[Diff_EnrgMechLoss(:,2)];  
%% Wheels and Breaks

Wheel_PwrRoad=data_Wheel_PwrRoad.Data;
Wheel_PwrRoad=[time';Wheel_PwrRoad(1:filter_step:end)']';

Wheel_EnrgRoad=data_Wheel_EnrgRoad.Data;
Wheel_EnrgRoad=[time';Wheel_EnrgRoad(1:filter_step:end)']';

Wheel_PwrMyRoll=data_Wheel_PwrMyRoll.Data;
Wheel_PwrMyRoll=[time';Wheel_PwrMyRoll(1:filter_step:end)']';

Wheel_EnrgMyRoll=data_Wheel_EnrgMyRoll.Data;
Wheel_EnrgMyRoll=[time';Wheel_EnrgMyRoll(1:filter_step:end)']';

Wheel_PwrMyBrk=data_Wheel_PwrMyBrk.Data;
Wheel_PwrMyBrk=[time';Wheel_PwrMyBrk(1:filter_step:end)']';

Wheel_EnrgMyBrk=data_Wheel_EnrgMyBrk.Data;
Wheel_EnrgMyBrk=[time';Wheel_EnrgMyBrk(1:filter_step:end)']';


dataset_Wheel_Pwr=[Wheel_PwrRoad(:,2),Wheel_PwrMyRoll(:,2),Wheel_PwrMyBrk(:,2)];
dataset_Wheel_Enrg=[Wheel_EnrgRoad(:,2),Wheel_EnrgMyRoll(:,2),Wheel_EnrgMyBrk(:,2)];
%% Vehicle dynamic

Vehicle_PwrFxDrag=data_Vehicle_PwrFxDrag.Data;
Vehicle_PwrFxDrag=[time';Vehicle_PwrFxDrag(1:filter_step:end)']';

Vehicle_EnrgFxDrag=data_Vehicle_EnrgFxDrag.Data;
Vehicle_EnrgFxDrag=[time';Vehicle_EnrgFxDrag(1:filter_step:end)']';


Vehicle_Inert_X=data_Vehicle_Inert_X.Data;
Vehicle_Inert_X=[time';Vehicle_Inert_X(1:filter_step:end)']';


dataset_Vehicle_Pwr=[Vehicle_PwrFxDrag(:,2),Vehicle_Inert_X(:,2)];
dataset_Vehicle_Enrg=[Vehicle_EnrgFxDrag(:,2),Vehicle_Inert_X(:,2)];



%% Combining the results of each block into a single dataset and save it


dataset_all_Pwr=[time,dataset_Battery,dataset_Motor_Pwr,dataset_Diff_Pwr,dataset_Wheel_Pwr,dataset_Vehicle_Pwr];
dataset_all_Enrg=[time,dataset_Battery,dataset_Motor_Enrg,dataset_Diff_Enrg,dataset_Wheel_Enrg,dataset_Vehicle_Enrg];



csvwrite('results_TeslaS/FTP75/dataset_Pwr.csv',dataset_all_Pwr);
csvwrite('results_TeslaS/FTP75/dataset_Enrg.csv',dataset_all_Enrg);





