% Is this the easiest way to perform this?? Maybe write these lines as an
% actual function so each line doesn't need to be called. (Looking into
% this JM 4/16/20)

logConflict = vertcat(trials.logConflict);
isConflict = vertcat(logConflict.isConflict);
    % returns isConflict logical array of isConflict fields
isConflictOnly = find(isConflict);
    % pulls out actual fields with error
boxLogConflict = vertcat(logConflict.boxLogConflicts); 
    % returns boxConflict in workspace with fields for outcome, RT, MT, pretone, centerNP sideNP