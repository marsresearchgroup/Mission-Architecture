function [people_mass_surface] = surface_mass_people(pep_to_surface,average_astro_mass)
%   [Function Name] = surface_mass_people
%   [Function Purpose] = To caluclate the mass of the people sent to the
%   surface
%   [Author] = Ravi Lumba
%   Inputs
%     pep_to_surface = (number of people to surface) in (people)
%     average_astro_mass = (average astronaut mass) in (kg)
%   Outputs
%     people_mass_surface = (mass of astronauts to the surface) in (kg)

%   ========
%   February 29, 2016 
%   ===============================================================
%   Copyright 2016 by Dr. Hans Mark.  All rights reserved.
people_mass_surface = pep_to_surface*average_astro_mass;
end