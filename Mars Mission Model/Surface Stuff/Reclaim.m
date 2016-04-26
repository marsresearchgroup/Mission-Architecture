function [water,oxygen,CH4p,O2s,water_rec] = Reclaim(days,water_d,oxygen_d,water_r,pep_to_surface,H2O,H2,offset,E)
%   [Function Name] = Reclaim
%   [Function Purpose] = To calculate the amount of oxygen, water, methane
%   that can be produced/recycled by the ISRU/recycler
%   [Author] = Ravi Lumba
%   Inputs
%     days = (stay time) in (days)
%     water_d = (water needed per day per astronaut) in (kg/day)
%     oxygen_d = (oxygen needed per day per astronaut) in (kg/day)
%     water_r = (percent of water recycled perday) in (%)
%     pep_to_surface = (total number of people to surface) in (people)
%     H2O = (amount of water brought) in (kg)
%     H2 = (amount of hydrogen brought) in (kg)
%     offset = (vector containing number of astronauts going early and how 
%     early they're going) in (people and days) 
%     E = (Efficiency of ISRU (100% equals 2011 numbers) in (100%)
%   Outputs
%     water = (water needed) in (kg)
%     oxygen = (oxygen needed) in (kg)
%     CH4p = (methane produced) in (kg)
%     O2s = (oxygen produced by ISRU) in (kg)
%     water_rec = (water recycled) in (kg)
 
%   ========
%   March 4, 2016 
%   ===============================================================
%   Copyright 2016 by Dr. Hans Mark.  All rights reserved.

water = 0;
oxygen = 0;
O2s = 0;
CH4p = 0;
water_rec = 0;
for i = 1:offset(1,1)
    %%% Amounts needed
    water = water + water_d*offset(2,1);
    oxygen = oxygen + oxygen_d*offset(2,1);
    H2u = .5026*E/100;
    if H2O > H2u*8.936
        %%% Sabitier
            H2u = .5026*E/100;
            H2Og = 2.2458*E/100;
            CH4 = E/100;

            H2O = H2O + H2Og;
            H2 = H2 - H2u;
        %%% Electrolysis
            H2Ou = H2u*8.936;
            O2 = H2u*7.936;

            H2O = H2O-H2Ou;
            H2 = H2 + H2u;
    end
    %%% Implement Recycling
    water_rec = water_rec + water_d*pep_to_surface*water_r/100;
    water = water - water_d*offset(2,1)*water_r/100;
    oxygen = oxygen - O2;
    O2s = O2s + O2;
    CH4p = CH4 + CH4p;
end
for i = (offset(1,1)+1):days
    %%% Amounts needed
    water = water + water_d*pep_to_surface;
    oxygen = oxygen + oxygen_d*pep_to_surface;
    H2u = .5026*E/100;
    if H2O > H2u*8.936
        %%% Sabitier
            H2u = .5026*E/100;
            H2Og = 2.2458*E/100;
            CH4 = E/100;

            H2O = H2O + H2Og;
            H2 = H2 - H2u;
        %%% Electrolysis
            H2Ou = H2u*8.936;
            O2 = H2u*7.936;

            H2O = H2O-H2Ou;
            H2 = H2 + H2u;
    end
    %%% Implement Recycling
    water_rec = water_rec + water_d*pep_to_surface*water_r/100;
    water = water - water_d*pep_to_surface*water_r/100;
    oxygen = oxygen - O2;
    O2s = O2s + O2;
    CH4p = CH4 + CH4p;
end

