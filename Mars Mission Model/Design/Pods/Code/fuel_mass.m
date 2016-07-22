function [mass_fuel] = fuel_mass(mass,backmass,aeromass)
V0 = 5800;
paramass = 54;
mass_fuel = mass;
Isp = 210;
g0 = 3.711;
err = inf;
while err > 1e-3
    KE0 = .5*(mass+backmass+aeromass+paramass+mass_fuel)*V0^2;
    KE1 = .01*KE0;
    V1 = sqrt(2*KE1/(mass+backmass+aeromass+paramass+mass_fuel));
    avgacc = 11000/(mass+backmass+aeromass+paramass+mass_fuel);
    V2 = V1 - avgacc*120;
    DV = V2; %m/s
    mass_fuel1 = mass*exp(DV/(Isp*g0))-mass;
    err = abs(mass_fuel1-mass_fuel);
    mass_fuel = mass_fuel1;
end
end

