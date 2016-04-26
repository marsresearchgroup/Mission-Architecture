function dy = edl_func(t,y,rho0,H,gM,RM,Beta)

dy = zeros(4,1);	%column vector of zeros

%with y(1) = V, y(2) = h, y(3) = fpa
y;
rho = rho0*exp(-(y(2))/H);
dy(1) = (-(rho*(y(1)^2))/(2*Beta))+(gM*sind(y(3)));
dy(2) = -(y(1)*sind(y(3)));
dy(3) = (-(y(1)*cosd(y(3)))/(RM+y(2)))+((gM*cosd(y(3)))/(y(1)));
% dy(4) = (-(rho*(y(4)^2))/(2*Beta));
dy(4) = y(1)*cosd(y(3));
end