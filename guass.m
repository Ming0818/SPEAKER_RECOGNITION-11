function [prob] = guass(var,mean,x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
c1=(var).^0.5;
c2=-((x-mean).^2);
c3=2*var;
prob=(exp(c2./c3))./c1;

end

