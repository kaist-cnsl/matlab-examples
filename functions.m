function[a] = acceleration(h,v)
% User-Defined Functions (Chap. 6)
clc; format compact; clear all;

% Declaring variables with global scope
global g
g = 9.81

a = h*v*g