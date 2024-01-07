function zad3()
% Examining the impact of the step size h on the aggregated errors delta_1
% and delta_2 defined by the formulas:
% delta_1(h) = [ ∑{n=1...N(h)} (yhat1(t_n,h) - ydot1(t_n))^2 ] /
%                                       [ ∑{n=1..N(h)} ( ydot1(t_n)^2) ]
%
% delta_2(h) = [ ∑{n=1...N(h)} (yhat2(t_n,h) - ydot2(t_n))^2 ] /
%                                       [ ∑{n=1..N(h)} ( ydot2(t_n)^2) ]
%
% where ydot1 and ydot2 are exact solutions of the system of differential
% equations provided below, solved using built-in matlab function dsolve
% dy_1(t)/dt = ( -26/3)y_1(t) - ( 10/3)y_2(t) + x(t)
% dy_2(t)/dt = ( 10/3) y_1(t) - ( 1/3)y_2(t) + x(t)
% over the interval [0,8], where x(t) = exp(-t)sin(t),
% for zero initial conditions
%
% and yhat1 and yhat2 are their approximations accordingly
%
% INPUT: NONE
% OUTPUT: NONE

% setting the limits for step step sizes to be examined
hmin = 0.01;
hmax = 1.5;
% creating a vector of the step sizes
h = linspace(hmin, hmax, 300);
n = length(h);
% extracting 'exact' solution, ydot1 and ydot2
[ydot1,ydot2] = zad1;
% preallocating space
deltasb = zeros(2,n);
deltasc = zeros(2,n);
deltasd = zeros(2,n);
for i = 1:n
    currdeltas = procescurrenth(h(i), ydot1, ydot2);
    deltasb(:,i) = currdeltas(1,:);
    deltasc(:,i) = currdeltas(2,:);
    deltasd(:,i) = currdeltas(3,:);
end
% plotting
% method b)
help_zad3(1,h,deltasb, "b");
% method c)
help_zad3(2, h, deltasc, "c");
% method d)
help_zad3(3, h, deltasd, "d");

end % function
