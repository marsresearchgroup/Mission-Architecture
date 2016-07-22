pressurized_volume = 150;
density1 = 2700;
density2 = 135.427;
thickness_light = .46;
thickness_heavy = .05;
connector_diameter = 1.5;
mass_connector = 200;
SA_connector = (connector_diameter/2)^2*pi; 

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
            mass_habitat = density1*(Vfloor+Vwall*2-SA_used_connector*thickness_heavy)+density2*Vceil;
            mass_module = mass_habitat + nc*mass_connector;
            ml = inf;
            if mass_module < ml
                ml = mass_module;
                ww = w(j);
                hh = h(i);
                ll = l;
            end
        end
    end
    mass(N_pods) = ml*N_pods;
    massp(N_pods) = ml;
    www(N_pods) = ww;
    hhh(N_pods) = hh;
    lll(N_pods) = ll;
end