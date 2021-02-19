% This script defines the parameters of the blocks of the TeslaS model such
% as battery configuration (series/parallel connection), differential,
% wheels, electric motor etc. These input parameters are necessary for an
% appropriate modeling of TeslaS driving behavior.


% TESLA MODEL S 100KWh

% driving range TeslaS: 600 km

driving_range=600;
% BATTERY

%battery  parallel and series cells
% Tesla S model has 8256 cells in 16 modules wired in series where each
% module contains 6 groups of 86 cells wired in parallel and the 6 groups are
% connected in series within the module 
% >>> Np=86
% >>> Ns=16*6=96
% Nominal capacity of 18650 Li-ion cell: 2.862 Ah
% Max energy provided by the battery: (Ns*Vnom)*(Np*Cmax)/1000=(96*4.2)*(86*2.96)/1000=100 kWh
Np=86; 
Ns=96;
BattChargeMax=2.86; % Charge of a Panasonic 18650 Li-ion cell: 2.80 Ah
%BattCapInit=2.86; % Charge of a Panasonic 18650 Li-ion cell: 2.860 Ah

T=25; % battery temperature

d_cell=18e-3;
l_cell=65e-3;
cell_volume=((d_cell/2)^2*pi)*l_cell; %[m^3]

kt=3.819; % radial thermal conductivity [W/(mK)]
%Ct=2.04e6;  % heat capacitance [J/m^3*K]

Cp_cell = 985.22; %[J/kg*K] Comsol
rho_cell = 2317.5; % [kg/m^3]  Comsol
Ct = Cp_cell*rho_cell*cell_volume;%[J/k]

h_conv=10; % W/m^2K

cell_surface=d_cell*pi*l_cell; %[m^2]
Rt=1/(h_conv*cell_surface*Np);


%DIFFERENTIAL
% diffRatio=3.4;
transRatio=9.3;
transEff=0.8;

% WHEELS
wheelRadius=0.23;
brakeRadius=0.360/2;

% ELECTRIC MOTOR
% Tesla S motor characteristic

%https://teslamotorsclub.com/tmc/threads/electric-motor-characteristics-and-curves.88185/

% motorSpeedRadPs is converted from mph to rad/s
motorMaxTorqueNm_my=[660 660 660 660 660 660 550 475 400 325 275 225 200 175 150 125];
motorSpeedRadPs_my = [0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150]*0.447*transRatio/wheelRadius;

torque_max=660;  % maximum torque for Tesla model S 100 kWh: 660 Nm for long distances
power_max=592e3; % maximum power for Tesla model S 100 kWh: 794 hp=592000 W =592 KW
regen_eff=0.7;

% VEHICLE BODY
% Horizontal distance from CG to front axle [m]
a=2.5;
% Horizontal distance from CG to rear axle [m]
b=2.5;
% CG height above axles 
% the height of the vehicle is 1.4 m,
% it is assumed that the CG is at half of the height of the vehicle
h=1.4/2;
% Drag coefficient
Cdrag=0.24;
% Frontal area [m^2]
Af=2.34; % 25.2 ft^2
% Mass of the vehicle [kg]
m=2250;

