function [food_mass_surface] = surface_mass_food(days_surface,food_perday_surface,pep_to_surface)
food_mass_surface = days_surface*food_perday_surface*pep_to_surface;
end