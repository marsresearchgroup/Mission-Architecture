function [volume_pressure] = volume_hab(pep_to_surface,days_surface,offset)
%   [Function Name] = volume_hab
%   [Function Purpose] = To calculate the pressurized volume needed for the habitat,
%   depending on the number of people and the stay time.
%   [Author] = Ravi Lumba
%   Inputs
%     pep_to_surface = (number of people to the surface) in (people)
%     days_surface = (number of days on the surface) in (days)
%     offset = (vector containing number of astronauts going early and how 
%     early they're going) in (people and days) 
%   Outputs
%     volume_pressure = (pressurized volume) in (m^3)
 
%   ========
%   February 29, 2016 
%   ===============================================================
%   Copyright 2016 by Dr. Hans Mark.  All rights reserved.
volume_per_person1 = 6.67*log(days_surface)-7.79;
volume_per_person2 = 6.667*log((days_surface-offset(1,1)))-7.79;
volume_habitable = volume_per_person1*offset(2,1) + volume_per_person2*(pep_to_surface-offset(2,1));
volume_pressure = volume_habitable/.6;


end

