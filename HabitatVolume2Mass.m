function [mass]=HabitatVolume2Mass(pressurized_volume, radius_height_ratio,density, thickness)
h = (pressurized_volume/((2*pi/3)*(radius_height_ratio^3)+pi*(radius_height_ratio^2)))^(1/3);
Rmin = radius_height_ratio*h;
Vshell = (2/pi)*(((Rmin+thickness)^3)-(Rmin^3))+(pi*h)*(((Rmin+thickness)^2)-(Rmin^2));
mass = Vshell*density;
end
