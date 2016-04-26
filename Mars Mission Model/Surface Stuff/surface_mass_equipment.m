function [equipment_mass_surface] = surface_mass_equipment(science,transportation,power,communication,suits,pep_to_surface,water_r,oxygen_r)
%   [Function Name] = surface_mass_equipment
%   [Function Purpose] = To calculate the mass of the equipment(science,
%   transportation, etc.) taken to the surface
%   [Author] = Ravi Lumba
%   Inputs
%     science = (mass of science equipment) in (kg)
%     transportation = (mass of rovers) in (kg)
%     power = (mass of power system) in (kg)
%     communication = (mass of communication system) in (kg)
%     suits = (mass of suits) in (kg)
%     pep_to_surface = (number of astronauts to surface) in (kg)
%     water_r = (mass of water recycler) in (kg)
%     oxygen_r = (mass of oxygen recycler) in (kg)
%   Outputs
%     equipment_mass_surface = (mass of equipment to surface) in (kg)
 
%   ========
%   February 29, 2016 
%   ===============================================================
%   Copyright 2016 by Dr. Hans Mark.  All rights reserved.
equipment_mass_surface = science+transportation+power+communication+(suits*2*pep_to_surface);
equipment_mass_surface = equipment_mass_surface + water_r + oxygen_r; 
end