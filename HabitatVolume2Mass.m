function [mass]=HabitatVolume2Mass(pressurized_volume, radius_height_ratio,density1,density2, thickness)
h = (pressurized_volume/((2*pi/3)*(radius_height_ratio^3)+pi*(radius_height_ratio^2)))^(1/3);
Rmin = radius_height_ratio*h;
V1 = (2*pi/3)*(((Rmin+thickness)^3)-(Rmin^3));
V2 = (pi*h)*(((Rmin+thickness)^2)-(Rmin^2));
mass1 = V1*density1;
mass2 = V2*density2;
mass = mass1+mass2;
end
