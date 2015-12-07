function [water_mass_surface] = surface_mass_water(astro_days_surface,water_perday_surface,water_recycle_per)
water_mass_surface = astro_days_surface*water_perday_surface;
recycled_water = water_mass_surface*water_recycle_per/100;
water_mass_surface = water_mass_surface - recycled_water;
end