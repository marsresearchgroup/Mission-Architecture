function [mass,massp,mmm,www,hhh,lll] = Design_Pod_Mass(volume_habitat,density1,density2,thickness_light,thickness_heavy,connector_diameter,mass_connector)
%%% Inputs %%%
SA_connector = (connector_diameter/2)^2*pi; 
pressurized_volume =volume_habitat;
mass = zeros(1,6);
massp = mass;
for N_pods = [1 2 3 4 5 6]
    h = linspace(2,3.25,100);
    Vind = pressurized_volume/N_pods;
    ml = inf;
    for i = 1:length(h)
        wl = 2*sqrt(16-h(i)^2);
        w = linspace(4,wl,100);
        for j = 1:length(w)
            l = Vind/((w(j)/2)^2/2*pi+h(i)*w(j));
            %%% How many habitats and their connectors%%%
            if N_pods == 1
                nc = 1;
            elseif N_pods == 2
                nc = 3/2;
            elseif N_pods == 3 
                nc = 5/3;
            elseif N_pods == 4
                nc = 3/2;
            elseif N_pods == 5
                nc = 8/5;
            elseif N_pods == 6
                nc = 3/2;
            end
            SA_used_connector = nc*SA_connector;
            dl = SA_used_connector/(2*h(i)+w(j));
            l = l+dl;
            Vfloor = l*w(j)*thickness_heavy;
            Vwall = (l*h(i)+w(j)*h(i))*thickness_heavy;
            Vceil = pi*((w(j)/2+thickness_light)^2-(w(j)/2)^2)*l/2;
            mass_habitat = density1*(Vfloor+Vwall*2)+density2*Vceil;
            mass_module = mass_habitat + nc*mass_connector;

            %%% EDL System Mass + Overall %%%
            mass_structure = 800;
            mass_heatshield = 4000;
            mass_backshell = mass_heatshield*349/385;
            mass_parachute = 54;
            err = 100;
            while err > 10
                mass_fuel_engine = fuel_mass(mass_module,mass_backshell,mass_heatshield);
                entrymass_module = mass_module + mass_parachute + mass_structure + mass_fuel_engine;
                [mass_heatshield1] = Heatshield_mass(entrymass_module,w(j));
                mass_backshell = mass_heatshield1*349/385;
                err = abs(mass_heatshield1-mass_heatshield);
                mass_heatshield = mass_heatshield1;
            end
            mass_system = (mass_fuel_engine + mass_heatshield + mass_backshell + mass_parachute + mass_structure); 
            m = (mass_module + mass_system);
            if m < ml
                ml = m;
                mm = mass_module;
                mf = mass_fuel_engine;
                ww = mass_heatshield;
                hh = mass_backshell;
%                 ww = w(j);
%                 hh = h(i);
                ll = l;
            end
        end
    end
    mass(N_pods) = ml*N_pods;
    massp(N_pods) = ml;
    mmm(N_pods) = mf;
    www(N_pods) = ww;
    hhh(N_pods) = hh;
    lll(N_pods) = ll;
end
end
