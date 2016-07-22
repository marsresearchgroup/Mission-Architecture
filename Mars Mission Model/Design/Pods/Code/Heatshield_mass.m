function [tps_totalmass] = Heatshield_mass(entrymass,dia)
%   [Function Name] = Heatshield_mass
%   [Function Purpose] = to calculate the mass of the heatshield 
%   [Author] = Ravi Lumba
%   Inputs
%     entrymass = (mass of pod) in (kg)
%     dia = (diameter of entry module) in (m)
%   Outputs
%     tps_totalmass = (mass of heashield) in (kg)
 
%   ========
%   February 29, 2016 
%   ===============================================================
%   Copyright 2016 by Dr. Hans Mark.  All rights reserved.






%%%%%REMEMBER TO REMOVE TITLES%%%%%

%%%CONSTANTS%%%
gE=9.81; %m/s^2
gM=3.69; %m/s^2
RM=3397; %km
sigma=5.67e-8; %W/(m^2*K^4)
k=1.9027e-4; %unitless
R=8314.472; %J/(K*kmol)

%%%PHOENIX SPECIFICATIONS%%%
% dia=2.65; %m 
CD=1.65; %unitless
%entrymass=603; %kg
cone=70; %degrees

%%%AZZUMPTIONS%%%
%effective nose radius
rn=0.665; %m
%exponential atmosphere
rho0=0.0525; %kg/m^3
T0=150; %K
M=43.27; %kg/kmol
%initial conditions
Vatm=4.9; %km/s
hatm=125; %km
gammaatm=17; %degrees
%Phoenix heatshield is made of SLA-561, 
epsilon=0.7; %has emmisivity of 0.7
%TPS initially has uniform temperature distribution of 25 Celsius=298.15K
%TPS bondline limit at 250Celsius, maximum set at 200celsius=473.15K

%%%Part A%%%
%ballistic coefficient:
Beta=entrymass/(CD*(pi*dia^2)/4);
%Allen-Eggers Constant
H=(R/M)*T0/gM;
C=-((rho0*H)/(2*Beta*sind(gammaatm)));

%%%PART B%%%
% hvec=linspace(1,125,125000);
% Vvec=zeros(length(hvec),1);
% for i=1:length(hvec)
%     Vvec(i)=Vatm*exp((-rho0*H/(2*Beta*sind(gammaatm)))*exp(-hvec(i)*1000/H));
% end


%%%PART C%%%
%height of max deceleration
% hnmax=H*log(-2*C);
% nmax=((Vatm*1000)^2)*sind(gammaatm)/(53.3*H);


%%%PART D%%%
%ode45
% y0 = [Vatm*1000;hatm*1000;gammaatm;Vatm*1000*cosd(gammaatm)];	%initial condition vector for ODE45
% h_final = 12.9*1000;
% t_entry=440; %seconds
% t_parachute=219; %seconds
% time=t_entry-t_parachute;
% tspan=[0 time];
% options=odeset('RelTol',1e-8,'AbsTol',[1e-8 1e-8 1e-8 1e-8]);
% [T,Y] = ode45(@(t,y)edl_func(t,y,rho0,H,gM,RM*1000,Beta),tspan,y0,options);
% ode_vel=Y(:,1);
% ode_h=Y(:,2);
% ode_fpa=Y(:,3);

%%%PART E%%%
%Sutton-Graves
%Analytical
% hv=linspace(hatm*1000,h_final,125000);
% qsAv=zeros(length(hv),1);
% for i=1:length(hv)
% 	V = Vatm*exp((-rho0*H/(2*Beta*sind(gammaatm)))*exp(-hv(i)/H));
% 	rho = rho0*exp(-hv(i)/H); 
% 	qsA = k*((rho/rn)^0.5)*(V*1000)^3;
% 	qsAv(i) = qsA;		
% end

%Numerical
% hvn=ode_h;
% qsNv=zeros(length(ode_h),1);
% for i=1:length(ode_h)
% 	V = ode_vel(i); 
% 	rho = rho0*exp(-hvn(i)/H); 
% 	qsN = k*((rho/rn)^0.5)*V^3;
% 	qsNv(i) = qsN;		
% end

%%%PART F%%%
qsmax=k*((Beta*sind(gammaatm)/(3*rn*H))^0.5)*(((Vatm*1000)^3)/exp(0.5));
Js=k*((Vatm*1000)^2)*(pi*H*Beta/(rn*sind(gammaatm)))^0.5;
%NEED COMPARISON TO VALUES
% Adiff=abs(qsmax-max(qsAv))/qsmax;
% Ndiff=abs(qsmax-max(qsNv))/qsmax;
% max(qsNv);
% max(qsAv);


%%%PART G%%%
%temperature
% Temp=(qsNv./(sigma*epsilon)).^(1/4);

%%%PART H%%%
rho_sla=0.288*(100^3)/1000;
coneheight=(dia/2)/tand(cone/2);
SAcone=pi*(dia/2)*sqrt(coneheight^2+(dia/2)^2);
MF=0.091*(Js/10000)^0.51575;
tps_materialmass=(MF/100)*entrymass;
tps_underlyingmass=0.15*entrymass; %structure assumption from slideshow (overestimate)
tps_totalmass=tps_materialmass+tps_underlyingmass;
tps_thickness=tps_materialmass/(rho_sla*SAcone);

%%%PART I%%%
%max deceleration
% actual_a=9.2;
% %analytical
% n=((Vatm*1000^2)*C*sind(gammaatm)/(H*gE)).*exp(2.*C.*exp((-hvec.*1000)./H)-((hvec.*1000)./H));
% max_a=max(abs(n));
% max_a=nmax;
%numerical
% aNv=zeros(length(ode_vel),1);
% for i=1:length(ode_h)
%   	rho=rho0*exp(-(ode_h(i))/H);
%     aNv(i)=(((Vatm*1000)^2)*C*sind(ode_fpa(i))/(H*gE))*exp(2*C*exp((-ode_h(i))/H)-((ode_h(i))/H));
% % 	aNv(i)=(((-rho*((ode_vel(i))^2))/(2*Beta))+(gM*sind(ode_fpa(i))));
% end
% max_an = max(abs(aNv));
% end
end