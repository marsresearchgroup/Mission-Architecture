%This model currently calculates the mass that you need to bring to Mars
%orbit that you don't use on the surface(not the landed mass itself).
%Includes the mass of food, water, and oxygen for the astronaut(s) who stay
%in space as well as EDL system mass.

[mass_supplies_space,foodm,waterm,oxygenm,water_rec,oxygen_rec] = supplies_orbit(offset,pep_to_surface,days_surface,astro_left_behind,water_recycle_per,water_recycle_lim,oxygen_perday_space,food_perday_space,water_perday_space);
pod_landed_mass = mass_to_surface-mass_habitat;
%Use MSL Heat Shield data
no_pods = ceil(pod_landed_mass/1000);
mass_EDL_supplies = 1600*no_pods;


[mass_EDL_Habitat] = Habitat_Pod_Mass(width_habitat,Num_Pods,mass_per);

orbit_mass = mass_EDL_Habitat + mass_EDL_supplies + mass_supplies_space;

