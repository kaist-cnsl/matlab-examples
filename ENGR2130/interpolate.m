function [ d ] = interpolate( g,g1,g2,d1,d2 )
% Interpolates between values in a table of data
%   g = the given value
%   g1, g2 = the table values which bracket the given value
%   d1, d2 = the table output values corresponding to g1, g2
%   d = the interpolated value between d1 and d2

d = d1 + (g - g1)/(g2-g1) * (d2-d1);

end

