function g = fgrade_152(R)
% Final grade calculator

% Set weights
wq = 0.3;
wr = 0.3;
wp = 0.1;
wf = 0.3;

% Set max scores
mq = [90 100 100];
mq = 1./mq;
mq = diag(mq)

mr = [100 100 100];
mr = 1./mr;
mr = diag(mr);

mp = [100];
mp = 1./mp;
mp = diag(mp);

mf = [100];
mf = 1./mf;
mf = diag(mf);

% Assign weights
q = R(:,2:4)
q = q * mq

r = R(:,5:7);
r = r * mr;

p = R(:,8);
p = p * mp;

f = R(:,9);
f = f * mf;

% Remove lowest scores for quizzes and recitations
qg = sort(q')';
qg = qg(:,2:3);

rg = sort(r')';
rg = rg(:,2:3);

% Compute weighted average
q = sum(qg')';
r = sum(rg')';

% Compute final grade
g = 100*(wq*q/2 + wr*r/2 + wp*p + wf*f);



