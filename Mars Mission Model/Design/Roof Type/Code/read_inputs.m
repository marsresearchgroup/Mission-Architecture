%%% Surface Stuff %%%
%pep_to_surface = input('People to Surface: ');
% offset(1,1) = input('How much earlier is first wave coming? (0 for all together): ');
% offset(2,1) = input('How many people are coming in the first wave?');
% days_surface = input('\nDays on Surface (longer one in case of offset): ');
% average_astro_mass = input(' \nAverage Astronaut mass: ');
% astro_left_behind = input(' \nPeople left in orbit: ');
% 
% H2O = input('How much backup water do you want to bring (kg): ');
% H2e = input('How much Hydrogen do you want to bring (kg): ');
% E = input('What is the efficiency of the ISRU (100% corresponds to 2011 tests');
pep_to_surface = 4;
offset(1,1) = 7;
offset(2,1) = 2;
days_surface = 30;
average_astro_mass = 80;
astro_left_behind = 1;

H2O = 50;
H2e = 50;
E = 100;

water_recycle_per = 70; %https://en.wikipedia.org/wiki/ISS_ECLSS#Water_recovery_systems 
water_recycle_lim = 10;
mass_oxygen_recycler = 1000; % combo of Sabatier and Electrolysis machines - https://en.wikipedia.org/wiki/Sabatier_reaction#Manufacturing_propellant_on_Mars 
mass_water_recycler = 1032.9; % From NASA Life Support Document
oxygen_perday_surface = .84; % Assuming same as on Earth
water_perday_surface = 14; % Assuming same as on Earth
food_perday_surface = 1.77; % Assuming same as on Earth
oxygen_perday_space = .84; % All three values (food, water, oxygen) - https://www.nasa.gov/pdf/146558main_RecyclingEDA(final)%204_10_06.pdf 
water_perday_space = 2.42;
food_perday_space = 1.77;

pressure_habitat = 101.325;
temperature_habitat = 298;
oxygen_percent_habitat = 22;
% density = input('What is the density of the material for the habitat? ');
% radius_height_ratio = input('What is the radius to height ratio of the habitat? ');
% thickness = input('What is the thickness of the habitat wall? ');
density_heavy = 4800;
density_light = 1400;
thickness = .05;

connector_diameter = 2.5;
mass_connector = 250;


mass_science = 200;  %estimation
mass_surface_transportation = 2700; %estimation (based on one pressurized (1500) and one non-pressurized(1200))
mass_power = 500; %estimation
mass_communication = 500; %estimation
mass_suits = 178;

mass_ascent_vehicle = 7362;
mass_return_sample = 100; %estimation
mass_return_science = 100; %estimation
backupdays_supplies_ascent_vehicle = 2; %input(' \nHow many days of supplies will the astronauts take in the ascent vehicle');
mass_ascent_fuel_per_kg = 2.4553;


%%%% Mars Orbit Stuff %%%%
% Mass_Decelerator = 
