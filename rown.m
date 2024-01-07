function dydt = rown(t,y)
% Packing a system of differential equations provided below
% dy_1(t)/dt = ( -26/3)y_1(t) - ( 10/3)y_2(t) + x(t)
% dy_2(t)/dt = ( 10/3) y_1(t) - ( 1/3)y_2(t) + x(t)
% into a single vector
% INPUT: NONE
% OUTPUT:
%   dydt - vector that contains the system of differential equations,
%          provided in the desciption of the function

dydt = [
    (-26/3)*y(1)+ (-10/3)*y(2) +  exp(-t)*sin(t);
    (10/3)*y(1) + (-1/3)*y(2) +  exp(-t)*sin(t)];

end % function