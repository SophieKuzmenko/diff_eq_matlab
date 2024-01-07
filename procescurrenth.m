function deltas = procescurrenth(h, ydot1, ydot2)
% calculating approximated solutions of the system of differential
% equations provided below:
% dy_1(t)/dt = ( -26/3)y_1(t) - ( 10/3)y_2(t) + x(t)
% dy_2(t)/dt = ( 10/3) y_1(t) - ( 1/3)y_2(t) + x(t)
% over the interval [0,8], where x(t) = exp(-t)sin(t),
% for zero initial conditions
% using ode45 and other methods ( b), c) and d),
% for more details see function descriptions of zad2bc and zad2d)
% and calculating their aggregated errors delta_1 and delta_2
% (for formulas see zad3)
% INPUT:
%   h           - current step size
%  ydot1, ydot2 - vectors of 'exact' solutions of the above's system of
%                 differential equations
% OUTPUT:
%   deltas      - vertical vector consisting of three sets of
%                 [delta_1, delta_2] calculated for methods b), c)
%                 and d) accordingly

tspan = [0,8];
t = tspan(1):h:tspan(2);
y1 = double(ydot1(t));
y2 = double(ydot2(t));
y1sum = sum(y1.*y1);
y2sum = sum(y2.*y2);
[ybhat, ychat] = zad2bc(h); % method b) and method c)
ydhat = zad2d(h); % method d)
deltas = zeros(3,2);
deltas(1,:) = countdeltas1(ybhat,y1,y2);
deltas(2,:) = countdeltas1(ychat,y1,y2);
deltas(3,:) = countdeltas1(ydhat,y1,y2);
deltas(:,1) = deltas(:,1)/y1sum;
deltas(:,2) = deltas(:,2)/y2sum;

end % function

