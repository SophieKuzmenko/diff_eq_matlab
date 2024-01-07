function help_plotter(f_ind, tmethod, t, y1, y2, ymethod, mtitle, slegend)
% Plotting an approximated solution of the system of differential equations
% provided below
% dy_1(t)/dt = ( -26/3)y_1(t) - ( 10/3)y_2(t) + x(t)
% dy_2(t)/dt = ( 10/3) y_1(t) - ( 1/3)y_2(t) + x(t)
% where x(t) = exp(-t)sin(t), over the interval [0,8]
% for zero initial conditions,
% in order to compare with exact solution
% INPUT:
%   f_ind   - figure index
%   tmethod - time vector for appproximated solutions
%   t       - time vector for exact solutions
%   y1, y2  - horizontal vectors containing exact solutions
%   ymethod - array consisting of approximated solutions of y1 and y2
%             accordingly
%   mtitle  - title for the plot, for example name of the method used
%             to calculate approximated solutions
%   slegend - vector consisting of legend for approximated solutions
%             of y1 and y2 accordingly
% OUTPUT: NONE

figure(f_ind)
hold on;
plot(tmethod, ymethod(1,:),"r", tmethod ,ymethod(2,:),"m", "LineWidth",2);
plot(t, y1(t),":y", t, y2(t),":g",'LineWidth',2 );
legend(slegend(1), slegend(2), 'y1', 'y2');
xlabel('t');
ylabel('y(t)');
title(mtitle);

end % function