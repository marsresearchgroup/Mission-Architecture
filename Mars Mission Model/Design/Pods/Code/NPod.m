clear all;
i = 0;
[No_Astronauts,length_No_Astronauts,StayTime,length_StayTime,Efficiency,length_Efficiency] = readin();
if length_No_Astronauts ~=1
    i = No_Astronauts;
    ii = 0;
end
if length_StayTime ~= 1
    if length(i) == 1
        i = StayTime;
        ii = 1;
    end
end
if length_Efficiency ~= 1
    if length(i) == 1
        i = Efficiency;
        ii = 2;
    end
end
for q = 1:length(i);
    r = 1;
    read_inputs;
    if ii == 0;
        pep_to_surface = i(q);
    elseif ii == 1
        days_surface = i(q);
    elseif ii == 2
        E = i(q);
    end
    volume_habitat = volume_hab(pep_to_surface,days_surface,offset);
    [mass,mass_pod] = Design_Pod_Mass(volume_habitat,density_heavy,density_light,thickness,connector_diameter,mass_connector);
    x(q,:) = mass;
    xx(q,:) = mass_pod;
    r = r+1;
end
if ii == 0
    x1 = x(1,:);
    x2 = x(2,:);
    x3 = x(3,:);
    x4 = x(4,:);
    x5 = x(5,:);
    x6 = xx(1,:);
    x7 = xx(2,:);
    x8 = xx(3,:);
    x9 = xx(4,:);
    x10 = xx(5,:);
    
    plot([1 2 3 4 5 6],x1,'b');
    hold on;
    plot([1 2 3 4 5 6],x2,'r');
    plot([1 2 3 4 5 6],x3,'g');
    plot([1 2 3 4 5 6],x4,'k');
    plot([1 2 3 4 5 6],x5,'m');
    g = 'Overall Habitat Mass';
    h = 'No of Pods';
    title([g,' vs. ',h]);
    xlabel('Number of Pods');
    ylabel('Overall Habitat Mass (kg)');
    for e = 1:length(i)
        leg(e,:) = sprintf('%1.0f Astronauts',i(e));
    end
    legend(leg);
    
    figure;
    plot([1 2 3 4 5 6],x6,'b');
    hold on;
    plot([1 2 3 4 5 6],x7,'r');
    plot([1 2 3 4 5 6],x8,'g');
    plot([1 2 3 4 5 6],x9,'k');
    plot([1 2 3 4 5 6],x10,'m');
    g = 'Mass per Pod';
    h = 'No of Pods';
    title([g,' vs. ',h]);
    xlabel('Mass per Pod');
    ylabel('Habitat Mass (kg)');
    legend(leg);
end
if ii == 1
    x1 = x(1,:);
    x2 = x(2,:);
    x3 = x(3,:);
    x4 = xx(1,:);
    x5 = xx(2,:);
    x6 = xx(3,:);
    plot([1 2 3 4 5 6],x1,'b');
    hold on;
    plot([1 2 3 4 5 6],x2,'r');
    plot([1 2 3 4 5 6],x3,'g');
    g = 'Overall Habitat Mass';
    h = 'No of Pods';
    title([g,' vs. ',h]);
    xlabel('Number of Pods');
    ylabel('Overall Habitat Mass (kg)');
    for e = 1:length(i)
        leg(e,:) = sprintf('%1.0f Day Staytime',i(e));
    end
    legend(leg);
    figure;
    plot([1 2 3 4 5 6],x4,'k');
    hold on;
    plot([1 2 3 4 5 6],x5,'m');
    plot([1 2 3 4 5 6],x6,'b');
    g = 'Mass per Pod';
    h = 'No of Pods';
    title([g,' vs. ',h]);
    xlabel('Number of Pods');
    ylabel('Mass per Pod (kg)');
    for e = 1:length(i)
        leg(e,:) = sprintf('%1.0f Day Staytime',i(e));
    end
    legend(leg);
end
