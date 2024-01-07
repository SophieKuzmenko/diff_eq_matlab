function [y1sol, y2sol] = zad1()
% Solving a system of differential equations provided below with built-in
% matlab function dsolve
% dy_1(t)/dt = ( -26/3)y_1(t) - ( 10/3)y_2(t) + x(t)
% dy_2(t)/dt = ( 10/3) y_1(t) - ( 1/3)y_2(t) + x(t)
% over the interval [0,8], where x(t) = exp(-t)sin(t),
% for zero initial conditions
% INPUT: NONE
% OUTPUT:
%   y1sol, y2sol - vectors containing solutions y_1 and y_2 found by dsolve
%                  over the interval [0,8]

syms t y1(t) y2(t);
x = exp(-t)*sin(t);
eqns = [ diff(y1, t) == -26/3*y1 - 10/3*y2 + x,...
    diff(y2, t) == 10/3*y1 - 1/3*y2 + x];
conds = [y1(0) == 0, y2(0) == 0];
[y1sol(t), y2sol(t)] = dsolve(eqns, conds);

end % function
