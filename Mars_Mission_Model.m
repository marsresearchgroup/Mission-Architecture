i = [100 200 300];%Please comment me!
for j = [1 2 3]
    r = 1;
    for k = [30 60 90]
    read_inputs;
    days_surface = k;
    E = i(j);
    surface_mass;
    x(j,r) = mass_to_surface;
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
title('Landed Mass vs. ISRU Efficiency');
xlabel('ISRU Efficiency (Compared to 2011 Tests');
ylabel('Total Landed Mass');
legend('30 days','60 days','90 days');
