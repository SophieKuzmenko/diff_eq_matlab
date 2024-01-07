function help_zad3(f_ind, H, deltasm, mn)
% Plotting the impact of the step size h on the aggregated errors delta_1
% and delta_2 defined by the formulas:
% delta_1(h) = [ ∑{n=1...N(h)} (yhat1(t_n,h) - ydot1(t_n))^2 ] /
%                                       [ ∑{n=1..N(h)} ( ydot1(t_n)^2) ]
%
% delta_2(h) = [ ∑{n=1...N(h)} (yhat2(t_n,h) - ydot2(t_n))^2 ] /
%                                       [ ∑{n=1..N(h)} ( ydot2(t_n)^2) ]
% where ydot1 and ydot2 are exact solutions and yhat1 and yhat2 are their
% approximations accordingly
% INPUT:
%   f_ind   - figure index
%   H       - vector of step sizes
%   deltasm - array consisting of two vectors of aggregated error values,
%             delta1 and delta2, where
%             deltai(j) corresponds to the step size h(j)
%             for i = 1,2 and j = 1,...,length(h)
%   mn      - string consisting of a name of the method used to calculate
%             yhat1 and yhat2
% OUTPUT: NONE

figure(f_ind)
clf;
hold on;
plot(H,deltasm(1,:),"r",H,deltasm(2,:), "m","LineWidth",2);
title("Impact of the step size h on the aggregated errors in method " +...
    mn +")");
legend("delta1" + mn, "delta2"+ mn);
xlabel("h");
ylabel("delta(h)");
xscale('log')
yscale('log')