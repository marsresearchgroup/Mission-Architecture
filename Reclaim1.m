function [water,oxygen,CH4,O2s] = Reclaim(days,water_d,oxygen_d,water_r,pep_to_surface,H2O,H2,offset,E)
CH4 = 0;
water = 0;
oxygen = 0;
O2s = 0;
for i = 1:offset(1,1)
    %%% Amounts needed
    water = water + water_d*offset(2,1);
    oxygen = oxygen + oxygen_d*offset(2,1);
    if H20 > H2u*8.936
        %%% Sabitier
            H2u = .5026*E/100;
            H2Og = 2.2458*E/100;
            CH4 = E/100;

            H2O = H2O + H2Og;
            H2 = H2 - H2u;
        %%% Electrolysis
            H2Ou = H2u*8.936;
            O2 = H2u*7.936;

            H20 = H20-H2Ou;
            H2 = H2 + H2u;
    end
    %%% Implement Recycling
    water = water - water_d*offset(2,1)*water_r/100;
    oxygen = oxygen - O2;
    O2s = O2s + O2;
end
for i = (offset(1,1)+1):days
    %%% Amounts needed
    water = water + water_d*pep_to_surface;
    oxygen = oxygen + oxygen_d*pep_to_surface;
    
    if H20 > H2u*8.936
        %%% Sabitier
            H2u = .5026*E/100;
            H2Og = 2.2458*E/100;
            CH4 = E/100;

            H2O = H2O + H2Og;
            H2 = H2 - H2u;
        %%% Electrolysis
            H2Ou = H2u*8.936;
            O2 = H2u*7.936;

            H20 = H20-H2Ou;
            H2 = H2 + H2u;
    end
    %%% Implement Recycling
    water = water - water_d*pep_to_surface*water_r/100;
    oxygen = oxygen - O2;
    O2s = O2s + O2;
end

