function [oxygen_mass_surface] = surface_mass_oxygen(astro_days_surface,oxygen_perday_surface,oxygen_recycle_per)
oxygen_mass_surface = astro_days_surface*oxygen_perday_surface;
recycled_oxygen = oxygen_mass_surface*oxygen_recycle_per/100;
oxygen_mass_surface = oxygen_mass_surface - recycled_oxygen;
%%% New way
mass = oxygen_perday_surface;
recycle = oxygen_perday_surface*oxygen_recycle_per/100;
oxygen_mass_surface = mass + (mass-recycle)*(astro_days_surface-1);
end

