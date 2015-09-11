function [root,ea,iter]=secant(func,xh,xi,es,maxit)
%
% Brian D. Wendt
% ME:4111 Numerical Calculations
% 11 September 2015
% 
% Project 1: "secant.m"
%
% Input Parameters:
%   func = name of function (or directly, e.g.: @(x)x^3-x-1)
%   xh = x_-1, initial guess #1
%   xi = x_0, initial guess #2 (req'd for Secant Method)
%   es = desired tolerance (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%
if nargin < 3, error('at least 3 input arguments required'), end
if nargin < 4 || isempty(es), es=0.0001; end
if nargin < 5 || isempty(maxit), maxit=50; end

% Initialize number of iterations
iter = 0;

% Create arrays for data table
i = [];
x_im1 = [];
x_i = [];
f_x_im1 = [];
f_xi = [];
E_a = [];

while (1)
    % Update table arrays
    i = [i; iter];
    x_im1 = [x_im1; xh];
    f_x_im1 = [f_x_im1; func(xh)];
    x_i = [x_i; xi];
    f_xi = [f_xi; func(xi)];

    % Compare error: ea < es ?
    if xi ~= 0 % xi not equal to zero
        ea = abs((xi - xh)/xi) * 100;
        E_a = [E_a; ea];
    end
    if ea <= es || iter >= maxit
        break;
    end

    % Update inputs for next iteration
    xi_plus1 = xi - ( (func(xi)*(xh-xi)) / (func(xh)-func(xi)) );
    xh = xi;
    xi = xi_plus1;
    iter = iter + 1;
end

% Print data table and root solution
T = table(i,x_im1,f_x_im1,x_i,f_xi,E_a)
root = xi;
