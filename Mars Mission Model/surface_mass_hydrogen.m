function [hydrogen_mass_surface] = surface_mass_hydrogen(mass_ascent_vehicle,mass_isru,mass_return_sample,mass_return_science,pep_to_surface,oxygen_perday_surface,water_perday_surface,food_perday_surface,surface_mass_people,mass_ascent_fuel_per_kg)
mass_ascent = mass_ascent_vehicle+mass_isru+mass_return_sample+mass_return_science;
mass_ascent = mass_ascent + pep_to_surface*(oxygen_perday_surface+water_perday_surface+food_perday_surface);
mass_ascent = mass_ascent + surface_mass_people;
fuel_ascent = mass_ascent*mass_ascent_fuel_per_kg;
hydrogen_mass_surface = .2513*fuel_ascent;
end

