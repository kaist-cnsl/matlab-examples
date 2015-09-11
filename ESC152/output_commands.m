% Output Commands
clc; format compact;

% fprintf (4.3.2)

% prints to screen or file
% can use 'escape characters' \n \b \t

fprintf('This is really something.\n');
fprintf('Why is it putting the ">>" character in?\n');
fprintf('Ohhh, its the input prompt.\n\n');

% including string variables
name = 'Brian';
fprintf('Hello, my name is %s.\n\n', name);

% including numerical variables (p. 94-5)
x = 120.97653128;
fprintf('Here is some numerical data: %-5.1f \n', x);
% %-5.2f
% f stands for fixed-point notation
fprintf('See how its rounded off? x = %s\n',  num2str(x));
fprintf('Oooh thats rounded off too!\n\n');

% whoa this is weird - check the output...
fprintf('My name is %c\n', name);
fprintf('My name is %g\n', name);
fprintf('My name is %f\n', name);
fprintf('My name is %s\n', name);

% Displaying a formatted matrix - TABLES!!!
x = 1:2:11;
y = x.^(1/2); % the DOT power - for matrix ops
z = [x;y];
fprintf('\nNum\tSqrt\n');
fprintf('%i %10.2f\n',z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% output to a file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% first open the file
% foo = fopen('myfile.txt','permissions');
% permissions: a-append only, r-read only, w-OVERwrites old data
myfile = fopen('myfile.txt','a');
fprintf(myfile, 'Hello world, %s was here.\n', name);
fclose(myfile);