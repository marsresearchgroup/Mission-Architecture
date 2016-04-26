function [ascent_backup_supplies] = backup_supplies_ascent(backupdays_supplies_ascent_vehicle,oxygen_perday_space,water_perday_space,food_perday_space,pep_to_surface)
%   [Function Name] = backup_supplies_ascent
%   [Function Purpose] = To calculate the amount of supplies needed during
%   the ascent from the Martian surface to Martian orbit (in case of
%   emergency/not being able to dock with the ascent vehicle straight away)
%   [Author] = Ravi Lumba
%   Inputs
%     backupdays_supplies_ascent_vehicle = (number of days of supplies) in (days)
%     oxygen_perday_space = (oxygen needed per day in space) in (kg/day)
%     water_perday_space = (water needed per day in space) in (kg/day)
%     food_perday_space = (food needed per day in space) in (kg/day)
%     pep_to_surface = (number of people sent to the surface) in (people)
%   Outputs
%     ascent_backup_supplies = (mass of backup supplies) in (kg)
 
%   ========
%   February 29, 2016 
%   ===============================================================
%   Copyright 2016 by Dr. Hans Mark.  All rights reserved.
backup_oxygen = backupdays_supplies_ascent_vehicle*oxygen_perday_space*pep_to_surface;
backup_food = backupdays_supplies_ascent_vehicle*food_perday_space*pep_to_surface;
backup_water = backupdays_supplies_ascent_vehicle*water_perday_space*pep_to_surface;
ascent_backup_supplies = backup_oxygen + backup_food + backup_water;
end