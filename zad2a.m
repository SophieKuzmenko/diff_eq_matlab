function [t,y] = zad2a()
% Solving a system of differential equations provided below with built-in
% matlab function ode45
% dy_1(t)/dt = ( -26/3)y_1(t) - ( 10/3)y_2(t) + x(t)
% dy_2(t)/dt = ( 10/3) y_1(t) - ( 1/3)y_2(t) + x(t)
% over the interval [0,8], where x(t) = exp(-t)sin(t),
% for zero initial conditions
% INPUT: NONE
% OUTPUT:
%   y1sol, y2sol - vectors containing solutions y_1 and y_2 found by dsolve
%                  over the interval [0,8]

tspan = [0 8];
[t,y] = ode45(@rown,tspan,zeros(2,1));

end % function