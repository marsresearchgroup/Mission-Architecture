function [hydrogen_mass_surface] = surface_mass_hydrogen(mass_AV,mass_RS,mass_return_science,surface_mass_people,ascent_backup_supplies,mass_ascent_fuel_per_kg,CH4)
mass_ascent = mass_AV+mass_RS+mass_return_science;
mass_ascent = mass_ascent + surface_mass_people + ascent_backup_supplies;
fuel_ascent = mass_ascent*mass_ascent_fuel_per_kg;
fuel_ascent = fuel_ascent - CH4;
hydrogen_mass_surface = .2513*fuel_ascent;
end

