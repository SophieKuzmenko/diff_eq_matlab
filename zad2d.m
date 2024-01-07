function y = zad2d(h)
% Solving a system of differential equations provided below
% dy_1(t)/dt = ( -26/3)y_1(t) - ( 10/3)y_2(t) + x(t)
% dy_2(t)/dt = ( 10/3) y_1(t) - ( 1/3)y_2(t) + x(t)
% over the interval [0,8], where x(t) = exp(-t)sin(t),
% for zero initial conditions
% using the method defined by formula d)
% d) Y_n = Y_{n-1} + h ∑{k=1...3} w_k*f_k,
% where Y_n = [ y_1(t_n), y_2(t_n)]' ,
% f_k = f(t_{n-1} + c_k*h, y_{n-1} + h*∑{K=1...3} a_{k,K}f_K ,
% coefficients w_*, a_{*,*} and c_* are taken from the Butcher's table
% and f is defined by formula  (t=t_n)=> dY(t)/dt = f(t_n, Y_n)
%
% Butcher's table
%  c_1 | a_{1,1} | a_{1,2} | a{1,3}  
%  c_1 | a_{2,1} | a_{2,2} | a{2,3} 
%  c_1 | a_{3,1} | a_{3,2} | a{3,3} 
%  --------------------------------
%      |   w_1   |   w_2   |   w_3     
%
%           |    |   
%           v    v  
%
%   0  | 1/6 | -1/6 |  0
%  1/2 | 1/6 |  1/3 |  0
%   1  | 1/6 |  5/6 |  0
%  -----------------------
%     | 1/6 |  2/3 | 1/6
%
% INPUT :
%   h  - size of the step
% OUTPUT:
%   y1 - horizontal vector [y_1, y_2]', containg y_1 and y_2
%        calculated  using method d)

% Creating a matrix of coefficients
al = [ 1/6, -1/6, 0;
    1/6, 1/3, 0;
    1/6, 5/6, 0];
A = [ -26/3, -10/3;
    10/3, -1/3 ];
I =  eye(2); % identity matrix
b = ones(2,1);
syms x1 x2 x3 yn1 yn2;
L = [ (I-h*al(1,1)*A), -h*al(1,2)*A, -h*al(1,3)*A;
    -h*al(2,1)*A, (I-h*al(2,2)*A), -h*al(2,3)*A;
    -h*al(3,1)*A, -h*al(3,2)*A, (I-h*al(3,3)*A) ];
p = [ (A*[yn1;yn2]) + b*x1;
    (A*[yn1;yn2]) + b*x2;
    (A*[yn1;yn2]) + b*x3;];
g = L\p;
% Main part of the task
tspan = [0,8];
t = tspan(1):h:tspan(2);
x = @(t) exp(-t).*sin(t);
N = length(t);
y = zeros(2,N);
w = [1/6, 2/3, 1/6];
gn = matlabFunction(g);

for i = 2:N
    gi = gn(x(t(i-1)), x(t(i-1)+1/2*h), x(t(i)), y(1,i-1), y(2,i-1));
    y(:,i) = y(:,i-1) + h*(w(1)*gi(1:2) +w(2)*gi(3:4) + w(3) * gi(5:6));
end

end % function