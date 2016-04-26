function [mass_habitat,surface_area,height_habitat,width_habitat,Num_Pods,mass_per]=HabitatVolume2Mass(pressurized_volume,density1,density2, thickness,connector_diameter,mass_connector)
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
%     thickness = (thickness of the habitat walls) in (m)
%   Outputs
%     mass = (mass of the habitat) in (kg)
%     surface_area = (surface area of the habitat) in (m^2)
 
%   ========
%   February 29, 2016 
%   ===============================================================
%   Copyright 2016 by Dr. Hans Mark.  All rights reserved.
mass = zeros(1,6);
height = mass;
width = mass;
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
            Vfloor = l*w(j)*thickness;
            Vwall = (l*h(i)+w(j)*h(i))*thickness;
            Vceil = pi*((w(j)/2+thickness)^2-(w(j)/2)^2)*l;
            mass_habitat = density1*(Vfloor+Vwall*2)+density2*Vceil;
            mass_module = mass_habitat + nc*mass_connector;
            %%% EDL System Mass + Overall %%%
            mass_parachute = 20; % Kiva
            mass_structure = 963;
            mass_fuel_engine = ceil((mass_module+mass_structure)/1000)*462;
            entrymass_module = mass_module + mass_parachute + mass_structure + mass_fuel_engine;
            [mass_heatshield] = Heatshield_mass(entrymass_module,w(j));
            mass_backshell = mass_heatshield*349/385;
            mass_system = (mass_fuel_engine + mass_heatshield + mass_backshell + mass_parachute + mass_structure); 
            m = (mass_module + mass_system);
            % pause(20)
            if m < ml
                ml = m;
                hh = h(i);
                ww = w(j);
                m_hab = mass_habitat;
            end
        end
    end
    mass(N_pods) = ml;
    height(N_pods) = hh;
    width(N_pods) = ww;
    mass_hab(N_pods) = m_hab;
end
mass_habitat_min = min(mass);
for r = [1 2 3 4 5 6]
    if mass_habitat_min == mass(r)
        height_habitat = height(r);
        width_habitat = width(r);
        Num_Pods = r;
        mass_habitat = mass_hab(r);
        break;
    end
end
mass_per = mass_habitat/Num_Pods;
end
