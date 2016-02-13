function [equipment_mass_surface] = surface_mass_equipment(science,transportation,power,communication,suits,pep_to_surface,water_r,oxygen_r)
equipment_mass_surface = science+transportation+power+communication+(suits*2*pep_to_surface);
equipment_mass_surface = equipment_mass_surface + water_r + oxygen_r; 
end