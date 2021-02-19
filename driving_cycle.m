
% This script defines the driving cycles given in input the EV model. 
% The folder driving_cycles contains folders with driving cycles measured
% from different agencies and conditions. In this example we consider FTP75
% from EPA.

% The txt files contain one cycle, which is clearly not sufficient to fully
% discharge the battery. For this reason, it is necessary to repeat the
% driving cycle for a sufficiently high number of repetition.
% An option could be to set a number of repetitions corresponding to the
% driving range of the EV. In this case, the number of repetition is simply
% the driving range divided by the distance covered by a single cycle.

% In the case of Tesla S and FTP75, ~34 repetitions are required, since a
% single FTP75 cycle correspond to ~ 18 km, and the driving range of TeslaS
% is ~ 600 Km. 

% Running the model for 34 repetitions takes time, so you can set n_repeat 
% just the test the model. A single repetition leads to a discharge of ~2%

% load the driving cycle
DriveCycle=load('driving_cycles/EPA_Vehicle_Chassis_Dynamometer_Driving_Schedules/FTP75.txt');

% FTP75 distance for a single cycle: 17.77 km
distance = 17.77;

% set the number of repetition corresponding to the driving range of the EV
% the drving range is defined in TeslaS_input_data (TeslaS) and
% NissanLeaf_input_data (Nissan Leaf)
%n_repeat = ceil(driving_range/distance);

% set 1 repetition just to test the model
n_repeat = 1;  

length_DriveCycle = length(DriveCycle);
DriveCycle_all_steps=zeros(length_DriveCycle*n_repeat,2);

for i=0:n_repeat-1
    DriveCycle_all_steps(i*length_DriveCycle+1:i*length_DriveCycle+1+length_DriveCycle-1,2)=DriveCycle(:,2);
end

DriveCycle_all_steps(:,1)=1:length_DriveCycle*n_repeat;

plot(DriveCycle_all_steps(:,2))
xlim([0 length_DriveCycle*n_repeat])
xlabel('time [s]')
ylabel('Speed [mph]')
