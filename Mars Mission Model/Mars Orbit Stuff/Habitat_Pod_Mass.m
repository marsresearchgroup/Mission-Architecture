function [mass_EDL] = Habitat_Pod_Mass(w,Num_Pods,mass_per)
%   [Function Name] = Habitat_Pod_Mass
%   [Function Purpose] = Calculate the mass of the EDL system needed for
%   the pod
%   [Author] = Ravi Lumba
%   Inputs
%     w = (width of pod) in (m)
%     Num_pods = (number of pods) in ()
%     mass_per = (mass of habitat per pod) in (kg)
%   Outputs
%     mass_EDL = (mass of EDL system) in (kg)
 
%   ========
%   February 29, 2016 
%   ===============================================================
%   Copyright 2016 by Dr. Hans Mark.  All rights reserved.

%%% EDL System Mass + Overall %%%
mass_parachute = 20; % Kiva
mass_structure = 963;
mass_fuel_engine = ceil((mass_per+mass_structure)/1000)*462;
entrymass_module = mass_per + mass_parachute + mass_structure + mass_fuel_engine;
[mass_heatshield] = Heatshield_mass(entrymass_module,w);
mass_backshell = mass_heatshield*349/385;
mass_system = (mass_fuel_engine + mass_heatshield + mass_backshell + mass_parachute + mass_structure); 
mass_EDL = Num_Pods*mass_system;
end
