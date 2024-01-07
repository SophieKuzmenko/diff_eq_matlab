function plotter()
% Comparing the solutions of the system of differential equations
% provided below
% dy_1(t)/dt = ( -26/3)y_1(t) - ( 10/3)y_2(t) + x(t)
% dy_2(t)/dt = ( 10/3) y_1(t) - ( 1/3)y_2(t) + x(t)
% where x(t) = exp(-t)sin(t), over the interval [0,8]
% for zero initial conditions.
% The solutions are calculated by functions:
% zad1 (being referred to as dsolve in the code below),
% zad2a (being referred to as ode45 in the code below)
% zad2bc ( being referred to as 'method b)' and 'method c)' in code below)
% for more details visit function's specification
% zad2d (being referred to as 'method d)' in the code below),
% INPUT: NONE
% OUTPUT: NONE

% Calculating solutions
h = 0.005; % step
[y1sol,y2sol] = zad1(); % dsolve, considered an 'exact' solution
y_d = zad2d(h); % method d)
[t_a,y_a] = zad2a(); % ode45
[y_b,y_c] = zad2bc(h); % methods b) and c)
% creating a time vector
tspan = [0 8];
t = tspan(1):h:tspan(2);
% plotting
% ode45
help_plotter(1, t_a, t, y1sol, y2sol, y_a', "ode45", ["y_1ode", "y_2ode"]);
% method b)
help_plotter(2, t, t, y1sol, y2sol, y_b, "Method b)", ["y_1b","y_2b"]);
% method c)
help_plotter(3, t, t, y1sol, y2sol, y_c, "Method c)", ["y_1c","y_2c"]);
% method d)
help_plotter(4, t, t, y1sol, y2sol, y_d, "Method d)", ["y_1d","y_2d"]);
% dsolve
figure(5)
plot(t, y1sol(t),"y", t, y2sol(t),"g",'LineWidth',2 );
legend('y1(t)', 'y2(t)');
xlabel('t');
ylabel('y(t)');

end % function