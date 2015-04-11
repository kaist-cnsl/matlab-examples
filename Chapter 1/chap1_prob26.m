% Chapter 1.10 Problem 26
clc;

disp('====================================================');
disp('              Sound Level Calculator');
disp('  Compares the relative loudness of two dB values');
disp('====================================================');

%  Reference pressure [Pa, when Lp = 0dB]
p0 = 20E-6;

% Passing truck, Lp [dB]
truck = input('(1) Enter the higher of two loudness (Lp) values [dB]: ');

% Normal conversation, Lp [dB]
convo = input('(2) Enter the lesser of two loudness (Lp) values [dB]: ');

% Find sound pressure, p, for the truck
p_truck = p0 * 10^(truck/20);

% Find sound pressure, p, for a conversation
p_convo = p0 * 10^(convo/20);

% How many times louder?
louder = p_truck/p_convo;

% Print results
truck_pa = sprintf('\nSound pressure (p) of Value #1 is %s Pa.', num2str(p_truck));
  disp(truck_pa);
convo_pa = sprintf('Sound pressure (p) of Value #2 is %s Pa.', num2str(p_convo));
  disp(convo_pa);
loudness = sprintf('\nValue #1 is %s times louder than Value #2!', num2str(louder));
  disp(loudness);
