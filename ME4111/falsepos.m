function [root,fx,ea,iter]=falsepos(func,xl,xu,es,maxit,varargin)
%
%
% create a function named 'func' in the Command Window like this:
%
%
%     func=@(x) sin(x) - x^2;
%
%
% falsepos: root location zeroes
% [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,p1,p2,...):
% uses false position method to find the root of func
%
% input:
% func = name of function (see above for creating)
% xl, xu = lower and upper guesses
% es = desired relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by func
%
% output:
% root = real root
% fx = function value at root
% ea = approximate relative error (%)
% iter = number of iterations

clc; format compact;

if nargin<3,error('at least 3 input arguments required'),end
test = func(xl,varargin{:})*func(xu,varargin{:});
if test>0,error('no sign change'),end
if nargin<4|isempty(es), es=0.0001;end
if nargin<5|isempty(maxit), maxit=50;end
iter = 0; xr = xl; ea = 100;

% Table arrays
n = [];
x_l = [];
x_u = [];
x_r = [];
f_xl = [];
f_xu = [];
f_xr = [];
E_a = [];

while (1)
  iter = iter + 1;
  xrold = xr;
  
  n = [n; iter];
  x_l = [x_l; xl];
  x_u = [x_u; xu];
  f_xl = [f_xl; func(xl)];
  f_xu = [f_xu; func(xu)];
  
  xr = xu - ( (func(xu)*(xu-xl)) / (func(xu)-func(xl)) );
  
  x_r = [x_r; xr];
  f_xr = [f_xr; func(xr)];
  
  if xr ~= 0
      ea = abs((xr - xrold)/xr) * 100;
  end
  test = func(xl,varargin{:})*func(xr,varargin{:});
  if test < 0
    % fprintf(' < 0, xu=xr\n');
    xu = xr;
  elseif test > 0
    % fprintf(' > 0, xl=xr\n');
    xl = xr;
  else
    ea = 0;
  end
  E_a = [E_a; ea];
  if ea <= es | iter >= maxit,break,end
end

T = table(n,x_l,x_u,f_xl,f_xu,x_r,f_xr,E_a)

root = xr; 
fx = func(xr, varargin{:});