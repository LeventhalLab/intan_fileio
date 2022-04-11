%% Code Practice for Patch logTrial.outcome == 6
 if trialData.timing.reactionTime + trialData.timing.movementTime > LimitedHold      % change the "1" to limited hold
        % this was a movement hold violation
        % check that logTrial was a movement hold violation
        % ignore the fact that MT won't match up (will be recorded as zero
        % in the logTrial structure)
        boxLogConflicts.outcome = ~(logTrial.outcome == 6);
        boxLogConlicts.RT = ~(abs(logTrial.RT - trialData.timing.reactionTime) < timingTolerance);
        boxLogConflicts.pretone = ~(abs(logTrial.pretone - trialData.timing.pretone) < timingTolerance);
        boxLogConflicts.centerNP = ~(logTrial.Center == trialData.centerNP);
        
        trialData.logConflict.isConflict = boxLogConflicts.outcome | ...
                                       boxLogConlicts.RT | ...
                                       boxLogConflicts.pretone | ...
                                       boxLogConflicts.centerNP;
                                   
        trialData.logConflict.boxLogConflicts = boxLogConflicts;
        
        return
    end

%% Code Practice for Patch logTrial.outcome == 4 
% The issue with this error on R0326 20200220 is that possibly the trip
% sensor activated through a unknown mechanism. This will be a very rare occurrence (hopefully)
% As you acquire more data, know this error may occur and if it happens frequenltly, debug (JM 20200601).

if trialData.timing.reactionTime > LimitedHold 
        trialData.countsAsTrial = 1;
        trialData.valid = 1;
        trialData.invalidNP = 0;
        trialData.holdTooLong = 1;
        trialData.movementTooLong = 0;
        trialData.falseStart = 0;

%         trialData.timing.wrongAnswerDelay = ...
%             trialEvents{HLidx}.timestamps - ...
%             (trialData.timestamps.tone + logTrial.responseDurationLimit);

        % check that outcome, center port, and pre-tone interval match with .log file
        boxLogConflicts.outcome = ~(logTrial.outcome == 4);
        boxLogConflicts.centerNP = ~(logTrial.Center == trialData.centerNP);
        boxLogConflicts.pretone = ~(abs(logTrial.pretone - trialData.timing.pretone) < timingTolerance);

        trialData.logConflict.isConflict = boxLogConflicts.outcome | ...
                                           boxLogConflicts.centerNP | ...
                                           boxLogConflicts.pretone;
        trialData.logConflict.boxLogConflicts = boxLogConflicts;
        return;

    end    % end if trialData.timing.reactionTime > LimitedHold