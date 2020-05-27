function [y] = gaussienne(x)
%Moyenne=2 et Variance=9
moyenne=2;
variance=9;
y=(1/sqrt(2*pi*sqrt(variance)))*exp(-(1/2)*((x-moyenne)/sqrt(variance))^2);
end

