function[y1,y2] = zad2bc(h)
% Solving a system of differential equations provided below
% dy_1(t)/dt = ( -26/3)y_1(t) - ( 10/3)y_2(t) + x(t)
% dy_2(t)/dt = ( 10/3) y_1(t) - ( 1/3)y_2(t) + x(t)
% over the interval [0,8], where x(t) = exp(-t)sin(t),
% for zero initial conditions
% using methods defined by formula b) and c)
% b) Y_n = Y_{n-1} + (h/2)[ 3f(t_{n-1},Y_{n-1}) - f(t_{n-2},Y_{n-2}) ]
% c) Y_n = Y_{n-1} + (h/12)[ 5f(t_n,Y_n) + 8f(t_{n-1},Y_{n-1})
%                                                   - f(t_{n-2},Y_{n-2}) ]
% where Y_n = [ y_1(t_n), y_2(t_n)]'
% and f is defined by formula  (t=t_n)=> dY(t)/dt = f(t_n, Y_n);
% INPUT :
%   h       - size of the step
% OUTPUT:
%   y1, y2  - are vectors [y_1, y_2]', containg y_1 and y_2 calculated
%             using method b) and c) accordingly

tspan = [0 8];
t = tspan(1):h:tspan(2); % time vector t
x = exp(-t).*sin(t);
n = length(t);
A = [-26/3, -10/3;
    10/3, -1/3];
b = ones(2,1);
y1 = zeros(2,n);
y2 = zeros(2,n);
y1(:,2) = (eye(2) -h*A)\(y1(:,1) + h*b*x(2)); % b)
y2(:,2) = (eye(2) -h*A)\(y2(:,1)+h*b*x(2)); % c)
for i = 3:n
    % b)
    y1(:,i) = (eye(2) + (3*h/2)*A)*y1(:,i-1) + b*x(i-1)*(3*h/2) - ...
        (h/2)*( A*y1(:,i-2) + b*x(i-2));
    % c)
    y2(:,i) = (eye(2) -(5*h/12)*A)\...
        ( (eye(2) + (8*h/12)*A)*y2(:,i-1) + (5*h/12)*b*x(i) + ...
        (8*h/12)*b*x(i-1) - (h/12)*(A*y2(:,i-2) + b*x(i-2)) );
end

end % function