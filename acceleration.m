function[a] = acceleration(h,v)
% Practicing User-Defined Functions (Chap. 6)
% File must have same name as function!!
% Declare a variable with global scope
global g
g = 9.81;
a = h*v*g;