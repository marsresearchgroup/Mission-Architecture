%%% This model currently calculates the amount of mass you would need to
%%% land on the the surface for a certain number of astronauts for a
%%% certain stay time. Right now, the assumptions are:
    %%% We don't lose any nitrogen from the habitat overtime.
    %%% We have an ascent vehicle that uses methane as propellant
    %%% The mass of the electrolysis machine is the same as the Sabatier
    %%% We have unlimted Sabatier and Electrolysis
    %%% Food, water, and oxygen needed per day on the surface is the same
    %%% as in space.
    
[water,oxygen,CH4,O2s] = Reclaim(days_surface,water_perday_surface,oxygen_perday_surface,water_recycle_per,pep_to_surface,H2O,H2e,offset,E);
food_mass_surface = surface_mass_food(days_surface,food_perday_surface,pep_to_surface,offset);
volume_habitat = volume_hab(pep_to_surface,days_surface,offset);
mass_habitat = HabitatVolume2Mass(volume_habitat, radius_height_ratio,density, thickness);
nitrogen_mass_surface = surface_mass_nitrogen(volume_habitat,oxygen_percent_habitat,pressure_habitat,temperature_habitat);
people_mass_surface = surface_mass_people(pep_to_surface,average_astro_mass);
equipment_mass_surface = surface_mass_equipment(mass_science,mass_surface_transportation,mass_power,mass_communication,mass_suits,pep_to_surface,mass_oxygen_recycler,mass_water_recycler);
ascent_backup_supplies = backup_supplies_ascent(backupdays_supplies_ascent_vehicle,oxygen_perday_space,water_perday_space,food_perday_space,pep_to_surface);
hydrogen_mass_surface = surface_mass_hydrogen(mass_ascent_vehicle,mass_return_sample,mass_return_science,people_mass_surface,ascent_backup_supplies,mass_ascent_fuel_per_kg,CH4);

mass_to_surface = oxygen + water + food_mass_surface + nitrogen_mass_surface + people_mass_surface + equipment_mass_surface + hydrogen_mass_surface+mass_ascent_vehicle + ascent_backup_supplies + mass_habitat;

output(water); %water needed
output(oxygen); %oxygen needed
output(CH4); %methane produced
output(O2s); % oxygen produced (amount you don't have to bring)
output(food_mass_surface); %food mass brought to surface 
output(nitrogen_mass_surface); %nitrogen mass brought to surface
output(people_mass_surface); %mass of the people to surface
output(equipment_mass_surface); %mass of equipment to surface
output(ascent_backup_supplies); %mass of backup supplies for ascent vehicle
output(hydrogen_mass_surface); %mass of hydrogen brought to surface
output(mass_to_surface); % overall mass to the surface
