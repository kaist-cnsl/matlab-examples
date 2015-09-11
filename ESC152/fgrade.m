function g = fgrade(R)
% Final grade calculator

% Iterate over R matrix
n = size(R); n = n(1); i = 1;
while i < n + 1
    % Add up HW 1-6
    hw = sum(R(i,2:7));

    % HW total is 15% of final grade (60 pts)
    homework = hw/60*100*0.10;

    % Each Midterm is 15% of final grade (300 pts)
    midterm = (R(i,8) + R(i,9) + R(i,10))/300*100*0.45;

    % Final exam is 45% of final grade (100 pts)
    final = R(i,11)*0.45;

    % Compute final grade
    g(i) = (homework + midterm + final);
    
    i = i + 1;
end