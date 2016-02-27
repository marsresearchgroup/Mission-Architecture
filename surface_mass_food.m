function [food_mass_surface] = surface_mass_food(days_surface,food_perday_surface,pep_to_surface,offset)
food_mass1 = offset(1,1)*offset(2,1)*food_perday_surface;
food_mass_surface = (days_surface-offset(1,1))*food_perday_surface*pep_to_surface + food_mass1;
end