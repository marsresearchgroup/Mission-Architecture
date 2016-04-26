function [hydrogen_mass_surface] = surface_mass_hydrogen(mass_AV,mass_RS,mass_return_science,surface_mass_people,ascent_backup_supplies,mass_ascent_fuel_per_kg,CH4)
%   [Function Name] = surface_mass_hydrogen
%   [Function Purpose] = To caluclate the mass of hydrogen needed to take
%   to the surface to make into methane
%   [Author] = Ravi Lumba
%   Inputs
%     mass_AV = (mass of the ascent vehicle) in (kg)
%     mass_RS = (mass of return samples) in (kg)
%     mass_return_science = (mass of science equipment returned) in (kg)
%     mass_people = (mass of people) in (kg)
%     ascent_backup_supplies = (mass of supplies for ascent trip) in (kg)
%     mass_ascent_fuel_per_kg = mass of kilogram needed per kilogram to
%     Mars orbit in (kg)
%     CH4 = (mass of methane recycled) in (kg)
%   Outputs
%     hydrogen_mass_surface = (mass of the hydrogen taken to the surface) in (kg)
 
%   ========
%   February 29, 2016 
%   ===============================================================
%   Copyright 2016 by Dr. Hans Mark.  All rights reserved.
mass_ascent = mass_AV+mass_RS+mass_return_science;
mass_ascent = mass_ascent + surface_mass_people + ascent_backup_supplies;
fuel_ascent = mass_ascent*mass_ascent_fuel_per_kg;
fuel_ascent = fuel_ascent - CH4;
hydrogen_mass_surface = .2513*fuel_ascent;
end

