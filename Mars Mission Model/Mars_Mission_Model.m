i = 0;
[No_Astronauts,length_No_Astronauts,StayTime,length_StayTime,Efficiency,length_Efficiency] = readin();
if length_No_Astronauts ~=1
    i = No_Astronauts;
    ii = 0;
    xlab = 'Number of Astronauts to Surface';
    tit = 'Number of Astronauts to Surface';
end
if length_StayTime ~= 1
    if length(i) == 1
        i = StayTime;
        ii = 1;
        xlab = 'Stay Time (days)';
        tit = 'Stay Time';
    else
        j = StayTime;
        jj = 1;
        leg = ['30 days';'60 days';'90 days'];
    end
end
if length_Efficiency ~= 1
    if length(i) == 1
        i = Efficiency;
        ii = 2;
        xlab = 'Performance Compared to 2011 Levels';
    else 
        j = Efficiency;
        jj = 2;
        leg = ['100%';'200%';'300%'];
    end
end
x = zeros(length(i),length(j));
for q = 1:length(i);
    r = 1;
    for k = j
        read_inputs;
        if jj == 1;
            days_surface = k;
        elseif jj == 2
            E = k;
        end
        if ii == 0;
            pep_to_surface = i(q);
        elseif ii == 1
            days_surface = i(q);
        elseif ii == 3
            E = i(q);
        end
        surface_mass;
        mars_orbit_mass;
        x(q,r) = mass_to_surface + orbit_mass;
        r = r+1;
    end
end
x1 = x(:,1);
x2 = x(:,2);
x3 = x(:,3);
plot(i,x1,'b');
hold on;
plot(i,x2,'r');
plot(i,x3,'g');
g = 'Mass to Orbit';
h = 'ISRU Capabilities';
title([g,' vs. ',tit]);
xlabel(xlab);
ylabel('Mass to Orbit (kg)');
legend(leg);
