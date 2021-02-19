
% This script defines the parameters of the blocks of the Nissan Leaf model such
% as battery configuration (series/parallel connection), differential,
% wheels, electric motor etc. These input parameters are necessary for an
% appropriate modeling of Nissan Leaf driving behavior.

% NISSAN LEAF MODEL

% Find the specifications on website:

% https://www.nissanusa.com/vehicles/electric-cars/leaf/specs/compare-trims.html
% https://www.caranddriver.com/nissan/leaf/specs

% Estimated range: 226 miles = 363 km

driving_range=363;

% BATTERY

%battery  parallel and series cells
% The newest Nissan Leaf model has 288 cells in 24 modules wired in series where each
% module contains 4 groups of 3 cells wired in parallel and the 4 groups are
% connected in series within the module 
% >>> Np=3
% >>> Ns=24*6=96
% Nominal capacity of  Li-ion cell: 56.3 Ah
% Max energy provided by the battery: (Ns*Vnom)*(Np*Cmax)/1000=(96*3.82)*(3*56.3)/1000 ~62 kWh
Np=3; 
Ns=96;
BattChargeMax=56.3; 
%BattCapInit=56.3; 

T=20; % battery temperature

l_cell=100e-3;
cell_volume=l_cell^2*Ns; %[m^3]

kt= 29; % radial thermal conductivity [W/(mK)]
%Ct=2.04e6;  % heat capacitance [J/m^3*K]

Cp_cell = 1399; %[J/kg*K] Comsol
rho_cell = 2055; % [kg/m^3]  Comsol
Ct = Cp_cell*rho_cell*cell_volume;%[J/k]

h_conv=10; % W/m^2K

cell_surface = l_cell^2; %[m^2]

Rt = 1/(h_conv*cell_surface*Np);
Rt = 0.01


%DIFFERENTIAL
transRatio=8.19; % 8.19: final transmission ratio for 2020 Nissan Leaf
transEff=1;

% WHEELS
wheelRadius=0.43/2; % 17 inch/2
brakeRadius=0.29/2; % 0.29 m = 11.5 in : brake rotors diameter

% ELECTRIC MOTOR

% Nissan Leaf motor characteristic

% https://www.automobile-catalog.com/curve/2019/2617175/nissan_leaf_sv.html

% motorSpeedRadPs is converted from rpm to rps
motorMaxTorqueNm_my=[340 340 340 340 340 340 300 260  230  210 190   175 160 150 140 130 125 120];
motorSpeedRadPs_my = [1000 1500 2000 2500 3000 3250 3500 4000 4500 5000 5500 6000 6500  7000 7500 8000 8500 9000]*transRatio*2*pi/60;

torque_max=340;  % 340Nm = 250 lb*ft maximum torque for 2020 Nissan Leaf
power_max=160e3; % 160kW = 214 hp maximum power for 2020 Nissan Leaf
regen_eff=0.7;


% VEHICLE BODY
% Horizontal distance from CG to front axle [m]
a=4.48/2; % length: 4.48m = 176.4 in 

% Horizontal distance from CG to rear axle [m]
b=4.48/2;  % length: 4.48m = 176.4 in 

% CG height above axles 

% it is assumed that the CG is at half of the height of the vehicle
h=1.55/2; % height: 1.55 m = 61.4 in

% Drag coefficient
Cdrag=0.28;

% Frontal area [m^2]
Af=2.58; % 27.85 ft^2

% Mass of the vehicle [kg]
m=1789;

