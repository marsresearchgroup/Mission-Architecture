function [mass_supplies_space,foodm,waterm,oxygenm,water_rec,oxygen_rec] = supplies_orbit(offset,pep_to_surface,days,astro_space,water_r,water_rlim,oxygen_dsp,food_dsp,water_dsp)
%   [Function Name] = supplies_orbit
%   [Function Purpose] = To calculate the amount of food, water, and oxygen
%   that will be needed by people in orbit
%   [Author] = Ravi Lumba
%   Inputs
%     offset = (vector containing number of astronauts going early and how 
%     early they're going) in (people and days) 
%     days = (stay time) in (days)
%     water_dsp = (water needed per day per astronaut) in (kg/day)
%     oxygen_dsp = (oxygen needed per day per astronaut) in (kg/day)
%     water_r = (percent of water recycled perday) in (%)
%     pep_to_surface = (total number of people to surface) in (people)
%     astro_space = (total number of astronauts left in orbit for the
%     duration of the mission) in (people)
%     H2O = (amount of water brought) in (kg)
%     H2 = (amount of hydrogen brought) in (kg)
%     E = (Efficiency of ISRU (100% equals 2011 numbers) in (100%)
%   Outputs
%     water = (water needed) in (kg)
%     oxygen = (oxygen needed) in (kg)
%     CH4p = (methane produced) in (kg)
%     O2s = (oxygen produced by ISRU) in (kg)
%     water_rec = (water recycled) in (kg)

foodm = 0;
waterm = 0;
oxygenm = 0;
water_rec = 0;
oxygen_rec = 0;

for i = 1:offset(1,1)
    pep = astro_space + (pep_to_surface + offset(2,1));
    foodm = foodm + pep*food_dsp;
    waterm = waterm + pep*water_dsp;
    oxygenm = oxygenm + pep*oxygen_dsp;
    
    if waterm <= 10;
        water_rec = water_rec + water_r*waterm;
        waterm = waterm - water_r/100*waterm;
    else 
        water_rec = water_rec + water_r*water_rlim;
        waterm = waterm-water_r/100*water_rlim;
    end
    if waterm > 2.25
        waterm = waterm + 2.25;
        oxygenm = oxygenm-2;
        oxygen_rec = oxygen_rec + 2;
    else 
        waterm = waterm + waterm;
        oxygenm = oxygenm-(8/9)*waterm;
        oxygen_rec = oxygen_rec + (8/9)*waterm;
    end
end
for i = offset(1,1)+1:days
    pep = astro_space;
    foodm = foodm + pep*food_dsp;
    waterm = waterm + pep*water_dsp;
    oxygenm = oxygenm + pep*oxygen_dsp;
    
    if waterm <= 10;
        water_rec = water_rec + water_r*waterm;
        waterm = waterm - water_r/100*waterm;
    else 
        water_rec = water_rec + water_r*water_rlim;
        waterm = waterm-water_r/100*water_rlim;
    end
    if waterm > 2.25
        waterm = waterm + 2.25;
        oxygenm = oxygenm-2;
        oxygen_rec = oxygen_rec + 2;
    else 
        waterm = waterm + waterm;
        oxygenm = oxygenm-(8/9)*waterm;
        oxygen_rec = oxygen_rec + (8/9)*waterm;
    end
end
mass_supplies_space = foodm + waterm + oxygenm;
end

