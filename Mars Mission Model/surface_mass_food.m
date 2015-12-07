function [food_mass_surface] = surface_mass_food(astro_days_surface,food_perday_surface)
food_mass_surface = astro_days_surface*food_perday_surface;
end