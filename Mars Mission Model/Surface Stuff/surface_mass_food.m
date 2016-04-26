function [food_mass_surface] = surface_mass_food(days_surface,food_perday_surface,pep_to_surface,offset)
%   [Function Name] = surface_mass_food
%   [Function Purpose] = To calculate the total mass of food needed for the
%   surface component of the mission
%   [Author] = Ravi Lumba
%   Inputs
%     days_surface = (days on the surface) in (days)
%     food_perday_surface = (food needed per day per astronaut) in (kg/day)
%     pep_to_surface = (number of people to surface) in (days)
%     offset = (vector containing number of astronauts going early and how 
%     early they're going) in (people and days) 
%   Outputs
%     food_mass_surface = (mass of the food needed to take to the surface) in (kg)
 
%   ========
%   February 29, 2016 
%   ===============================================================
%   Copyright 2016 by Dr. Hans Mark.  All rights reserved.

food_mass1 = offset(1,1)*offset(2,1)*food_perday_surface;
food_mass_surface = (days_surface-offset(1,1))*food_perday_surface*pep_to_surface + food_mass1;
end