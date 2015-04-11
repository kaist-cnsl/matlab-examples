% tutorial07_v00.m
%   Version 0
%
%   this script 
%       reads a set of data, [x,y]
%       and completes an elementary statistics
%           including a least-squares analysis
%
%   last reviewed 10/11/11
%       by
%   Jorge E. Gatica, <j.gatica@csuohio.edu>
%   Department of Chemical and Biomedical Engineering
%   Cleveland State University
%

% clear screen
clc;
% cleanup memory
clear;

[Data_num, Data_txt, Data_raw] = ...
    xlsread ('Data_tutorial07.xlsx', 'Analysis');

% assign data to new variables
x = Data_num (:, 1); % first column, all rows !!!
y = Data_num (:, 2); % second column, all rows !!!

% plot data
figure(1)
plot(x, y, 'bo');
grid on;

% Annotate the plot
ylabel('Dependent Variable, "Y" ');
xlabel('Independent Variable, "X" ');

Experimental_Data = [x y]

% assign variables
Years = x;
Population = y;


% Least-Squares: Polynomial Fitting
% Calculate fit parameters

order = input ('Enter order of the "polynomial fit": ');

% help polyfit
%  POLYFIT Fit polynomial to data.
%     P = POLYFIT(X,Y,N) finds the coefficients of a polynomial P(X) of
%     degree N that fits the data Y best in a least-squares sense. P is a
%     row vector of length N+1 containing the polynomial coefficients in
%     descending powers, P(1)*X^N + P(2)*X^(N-1) +...+ P(N)*X + P(N+1).

p = polyfit (x, y, order)

% Calculate predicted values

% help polyval
%  POLYVAL Evaluate polynomial.
%     Y = POLYVAL(P,X) returns the value of a polynomial P evaluated at X. P
%     is a vector of length N+1 whose elements are the coefficients of the
%     polynomial in descending powers.
%  
%         Y = P(1)*X^N + P(2)*X^(N-1) + ... + P(N)*X + P(N+1)
%  
%     If X is a matrix or vector, the polynomial is evaluated at all
%     points in X.  See POLYVALM for evaluation in a matrix sense.

y_fit = polyval (p, x);


%   Add a more "sound" Error Analysis
%       let's use a more advanced level

%     [P,S] = POLYFIT(X,Y,N) returns the polynomial coefficients P and a
%     structure S for use with POLYVAL to obtain error estimates for
%     predictions.  S contains fields for the triangular factor (R) from a QR
%     decomposition of the Vandermonde matrix of X, the degrees of freedom
%     (df), and the norm of the residuals (normr).  If the data Y are random,
%     an estimate of the covariance matrix of P is (Rinv*Rinv')*normr^2/df,
%     where Rinv is the inverse of R.

[p,s]=polyfit(x,y,order);

%   
%     [Y,DELTA] = POLYVAL(P,X,S) uses the optional output structure S created
%     by POLYFIT to generate prediction error estimates DELTA.  DELTA is an
%     estimate of the standard deviation of the error in predicting a future
%     observation at X by P(X).

[y_fit, Ey]=polyval(p,x,s);

% let's estimate the errors
Absolute_Error = abs(y - y_fit);
Relative_Error = Absolute_Error./abs(y) * 100;

Errors = [Absolute_Error Relative_Error];

hold on;
plot(x, y_fit, 'b.-');

%find Tstu
risk=0.05;
N=length(x);
M=order+1;
df=N-M;
t=tstud(risk,N,M);
%plot confidence intervals
y_lower=y_fit-t*Ey;
y_upper=y_fit+t*Ey;

%hold on;
plot(x,y_lower,'r:');
plot(x,y_upper,'r:');
% Annotate the plot
title ('Tutorial 07: Linear Regression and Confidence Intervals');
xlabel('Independent Variable');
ylabel('Dependent Variable, y');

% create a tailored legend
legend1 = num2str (order, ' Polynomial Model (order = %2i)');
legend ('Experimental Data', legend1)

% release the plot
hold off;

% Print and plot the Results
% Table_of_Results = [x y y_fit Errors];
Table_of_Results = [x y y_lower y_fit y_upper];
fprintf ('\n %9.2f \t %9.2f \t %9.2f \t %9.2f \t  %9.2f  %%' ...
    , Table_of_Results');

% Examine the residuals !
fprintf('\n Press <Enter> to continue ...\n');
pause;

figure(2)
% verify residuals
Residuals = y - y_fit;
subplot (1,2,1), plot(x, Residuals,'bo');
grid on;
% Annotate the plot
title ('Tutorial 07: Analysis of the Residuals');
xlabel('Independent Variable');
ylabel('Residuals [y - y_{fit}]');

hold on;
% add a line at "0"
plot ([x(1) x(end)], [0 0 ], 'r-');
hold off;

subplot (1,2,2), plot(y, y_fit,'bo');
grid on;
% Annotate the plot
title ('Tutorial 07: Goodness of Fit Analysis');
xlabel('y [Experimental]');
ylabel('y [Predicted]');

