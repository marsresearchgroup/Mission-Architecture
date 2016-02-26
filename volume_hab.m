function [volume_pressure] = volume_hab(pep_to_surface,days_surface,offset)
volume_per_person1 = 6.67*log(days_surface)-7.79;
volume_per_person2 = 6.667*log((days_surface-offset(1,1))-7.79;
volume_habitable = volume_per_person1*offset(2,1) + volume_per_person2*(pep_to_surface-offset(2,1));
volume_pressure = volume_habitable/.6;


end

