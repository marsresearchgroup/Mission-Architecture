function [nitrogen_mass_surface] = surface_mass_nitrogen(volume_habitat,oxygen_percent_habitat,pressure_habitat,temperature_habitat)
%   [Function Name] = surface_mass_nitrogen
%   [Function Purpose] = Calculate the mass of the nitrogen needed to
%   transport to the surface 
%   [Author] = Ravi Lumba
%   Inputs
%     volume_habitat = (volume of the habitat) in (m^3)
%     oxygen_percent_habitat = (percent of atmosphere that's nitrogen) in (percent)
%     pressure_habitat = (pressure of the habitat) in (KPa)
%     temperature_habitat = (temperature of the habitat) in (K)
%   Outputs
%     X = (mass of nitrogen) in (kg)
%   ========
%   February 29, 2016 
%   ===============================================================
%   Copyright 2016 by Dr. Hans Mark.  All rights reserved.
nitrogen_volume = volume_habitat*(1-oxygen_percent_habitat/100);
density_nitrogen = pressure_habitat/(.297*temperature_habitat);
nitrogen_mass_surface = nitrogen_volume*density_nitrogen;
% nitrogen_mass_surface = 2*nitrogen_mass_surface;   Safety Factor????
end

