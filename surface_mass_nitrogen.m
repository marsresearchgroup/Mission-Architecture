function [nitrogen_mass_surface] = surface_mass_nitrogen(volume_habitat,oxygen_percent_habitat,pressure_habitat,temperature_habitat)
nitrogen_volume = volume_habitat*(1-oxygen_percent_habitat/100);
density_nitrogen = pressure_habitat/(.297*temperature_habitat);
nitrogen_mass_surface = nitrogen_volume*density_nitrogen;
% nitrogen_mass_surface = 2*nitrogen_mass_surface;   Safety Factor????
end

