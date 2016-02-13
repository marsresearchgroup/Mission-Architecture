function [water,oxygen,CH4,O2s] = Reclaim(days,water_d,oxygen_d,water_r,pep_to_surface)
H2O = input('How much backup water do you want to bring (kg): ');
H2e = input('How much Hydrogen do you want to bring (kg): ');
CH4 = 0;
water = 0;
oxygen = 0;
O2s = 0;
for i = 1:days
    %%% Amounts needed
    water = water + water_d*pep_to_surface;
    oxygen = oxygen + oxygen_d*pep_to_surface;
    
    %%% Electrolysis
    H2 = H2O*.1119;
    O2 = H2O*.8881;
    
    %%% Sabitier
    H2 = H2e + H2;
    CO2 = H2*5.4675;
    m1 = H2+CO2;
    CH4 = CH4 + .3081*m1;
    H2O = .6919*m1;
    
    %%% Implement Recycling
    water = water - water_d*pep_to_surface*water_r/100;
    oxygen = oxygen - O2;
    O2s = O2s + O2;
end

