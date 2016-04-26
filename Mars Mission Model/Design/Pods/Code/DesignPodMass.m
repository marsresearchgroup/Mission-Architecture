%%% Inputs %%%
SA_connector = 1.5^2*pi;
mass_connector = 250; 
pressurized_volume =93.3678;
thickness = .04;
density1 = 4800;
density2 = 1400;
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
            end
        end
    end
    mass(N_pods) = ml;
    massp(N_pods) = ml/N_pods;
end
plot([1 2 3 4 5 6],mass);
figure;
plot([1 2 3 4 5 6],massp);