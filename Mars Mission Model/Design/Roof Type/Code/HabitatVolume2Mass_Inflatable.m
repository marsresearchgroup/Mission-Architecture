function [mass,surface_area]=HabitatVolume2Mass_Inflatable(pressurized_volume,density1,density2, thickness_light,thickness_heavy,connector_diameter,mass_connector)
%   [Function Name] = HabitatVolume2Mass
%   [Function Purpose] = To calculate the mass of the habitat depending on
%   the required pressurized volume. Uses the shape of the habitat as a
%   cylindar with a semispherical ceiling.
%   [Author] = Wesley Yu
%   Inputs
%     pressurized_volume = (the pressurized volume) in (m^3)
%     radius_height_ratio = (the ratio of radius to height) in ()
%     density1 = (density of the material used for the rigid cylindrical 
%     body) in (kg/m^3)
%     density1 = (density of the material used for the semispherical 
%     ceiling ) in (kg/m^3)
%     thickness_heavy = (thickness of the habitat walls solid part) in (m)
%     thickness_light = (thickness of the habitat walls light part) in (m)
%   Outputs
%     mass = (mass of the habitat) in (kg)
%     surface_area = (surface area of the habitat) in (m^2)
 
%   ========
%   February 29, 2016 
%   ===============================================================
%   Copyright 2016 by Dr. Hans Mark.  All rights reserved.
mass = zeros(1,6);
SA_connector = (connector_diameter/2)^2*pi;

for N_pods = [1 2 3 4 5 6]
    h = linspace(2,3.25,100);
    Vind = pressurized_volume/N_pods;
    ml = inf;
    for i = 1:length(h)
        wl = 2*sqrt(16-h(i)^2);
        w = linspace(4,wl,100);
        for j = 1:length(w)
            l = Vind/((w(j)/2)^2*pi+h(i)*w(j));
            surface_area = l*w(j)+2*h(i)*l+2*h(i)*w(j);  
            %%% How many habitats and their connectors%%%
            if N_pods == 1
                nc = 1;
            elseif N_pods == 2
                nc = 2;
            elseif N_pods == 3 
                nc = 8/3;
            elseif N_pods == 4
                nc = 10/3;
            elseif N_pods == 5
                nc = 13/3;
            elseif N_pods == 6
                nc = 15/3;
            end
            SA_used_connector = nc*SA_connector;
            dl = SA_used_connector/(2*h(i)+w(j));
            l = l+dl;
            Vfloor = l*w(j)*thickness_heavy;
            Vwall = (l*h(i)+w(j)*h(i))*thickness_heavy;
            Vceil = pi*((w(j)/2+thickness_light)^2-(w(j)/2)^2)*l;
            mass_habitat = density1*(Vfloor+Vwall*2)+density2*Vceil;
            mass_module = mass_habitat + nc*mass_connector;
            % pause(20)
            if mass_module < ml
                ml = mass_module;
            end
        end
    end
    mass(N_pods) = ml;
end

% h = 2;
% w = 6.5;
% Vind = pressurized_volume/N_pods;
% l = Vind/((w/2)^2*pi+h*w);
% Vfloor = l*w*thickness;
% Vwall = (l*h+w*h)*thickness;
% Vceil = pi*((w/2+thickness)^2-(w/2)^2)*l;
% mass = density1*(Vfloor+Vwall*2)+density2*Vceil;
% mass = mass*N_pods;
% surface_area = l*w+2*h*l+2*h*w;

% Case 1 Hard Ceiling
% h = 2.5;
% w = 6;
% Vind = pressurized_volume/N_pods;
% l = Vind/(h*w);
% Vfloor = l*w*thickness;
% Vwall = (l*h+w*h)*thickness;
% mass = density1*(Vfloor*2+Vwall*2);
% mass = mass*N_pods;
% surface_area = l*w+2*h*l+2*h*w;
%Case 2 Inflatable Ceiling
end
