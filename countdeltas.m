function [delta1,delta2] = countdeltas1(yhat,y1,y2)
% Partly calculating the values of aggregated errors delta_1
% and delta_2 defined by the formulas:
% delta_1(h) = [ ∑{n=1...N(h)} (yhat1(t_n,h) - ydot1(t_n))^2 ] /
%                                       [ ∑{n=1..N(h)} ( ydot1(t_n)^2) ]
%
% delta_2(h) = [ ∑{n=1...N(h)} (yhat2(t_n,h) - ydot2(t_n))^2 ] /
%                                       [ ∑{n=1..N(h)} ( ydot2(t_n)^2) ]
%
% where ydot1 and ydot2 are exact solutions of a certain system
% of differential equations
% and yhat1 and yhat2 are their approximations accordingly
% INPUT:
%  yhat           - array: [yhat1;yhat2] consisting of the approximated
%                   solutions of a certain system of differential equations
%  y1, y2         - vectors of exact solution
% OUTPUT:
%  delta1, delta2 - partly calculated vectorsof delta_1 and delta_2
%                    accordingly

s11 = (yhat(1,:) - y1);
s11 = sum(s11.*s11);
delta1 = s11;
s21 = yhat(2,:) - y2;
s21 = sum(s21.*s21);
delta2 = s21;

end % function
