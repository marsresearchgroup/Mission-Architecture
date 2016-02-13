%%% Surface Stuff %%%
pep_to_surface = input('People to Surface: ');
days_surface = input('\nDays on Surface:');
average_astro_mass = input(' \nAverage Astronaut mass: ');
astro_left_behind = input(' \nPeople left in orbit: ');

water_recycle_per = 70; %https://en.wikipedia.org/wiki/ISS_ECLSS#Water_recovery_systems 
mass_oxygen_recycler = 100; % combo of Sabatier and Electrolysis machines - https://en.wikipedia.org/wiki/Sabatier_reaction#Manufacturing_propellant_on_Mars 
mass_water_recycler = 1032.9; % From NASA Life Support Document
oxygen_perday_surface = .84; % Assuming same as space
water_perday_surface = 2.42; % Assuming same as space
food_perday_surface = 1.77; % Assuming same as space
oxygen_perday_space = .84; % All three values (food, water, oxygen) - https://www.nasa.gov/pdf/146558main_RecyclingEDA(final)%204_10_06.pdf 
water_perday_space = 2.42;
food_perday_space = 1.77;

volume_habitat = input(' \nWhat is the volume of the habitat?');
pressure_habitat = 101.325;
temperature_habitat = 298;
oxygen_percent_habitat = 22;
mass_habitat = input(' \nWhat is the mass of the habitat?');

mass_science = 200;  %estimation
mass_surface_transportation = 3500; %estimation (based on one pressurized and one non-pressurized)
mass_power = 500; %estimation
mass_communication = 500; %estimation
mass_suits = 178;

mass_ascent_vehicle = 7362;
mass_return_sample = 100; %estimation
mass_return_science = 100; %estimation
backupdays_supplies_ascent_vehicle = input(' \nHow many days of supplies will the astronauts take in the ascent vehicle');
mass_ascent_fuel_per_kg = 2.4553;






