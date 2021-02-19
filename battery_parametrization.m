% This script created the lookup tables for the parametrization of the
% Datasheet Battery block in the Simulink EV model.

% HOW IT WORKS

% 1) First, we chage directory to 'parametrization_steps_TeslaS'. This
% directory contains the scripts which performs the parametrization

% battery parametrization data from comsol

cd ('parametrization_steps_TeslaS');
%cd ('parametrization_steps_NissanLeaf');


% 2) We set the temperature T at which we want to perform the
% parametrization

T=20;

%3) We run the script 'all_steps' . In total, there are 9 scripts which
% perform the parametrization, names step_1, step_2, ... , step_9.
% Running 'all_steps' allows to run all of them in one shot. 
% These 9 scripts build the lookup tables using the dishcarge curves at
% constant C-rate = 1 at different temperatures T = 243 K, 273 K, 293 K
% and 333 K, and at constant temperature T = 293 K at different C-rates C =
% 0.2, 1, 2, 4. The discharge curves have been computed in COMSOL
% Multiphysics using a P2D model of the Li-Ion Battery, where the
% appropriate anode and cathode materials have been selected (C-NMC for
% Tesla S and C-LMO for Nissan Leaf). The discharge curves are saved in txt
% files located in the folders
% 'parametrization_steps_TeslaS/discharge_curves' for TeslaS and 
% 'parametrization_steps_NissanLeaf/discharge_curves' for Nissan Leaf

run('all_steps');

% Finally, we come back to the main folder where the other input files are
% located
cd ..
