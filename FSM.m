classdef FSM
    % UPTIME - WCNC
    % Finite State Machine
    % Step Detection
    % transferThresholds = [0.6, 1.8, -1, -0.6];
    
    properties
        thresholds = zeros(4,1);
        inputData = [];
        counter = [];
    end % end properties
    
    methods
        
        function self = FSM(data, Thresholds)
            self.thresholds = Thresholds;
            self.inputData = data;
            self.counter = 0;
        end
        
        function [stepCount, stateSequence, timestamp] = run(self)
            data = self.inputData;
            transferThresholds = self.thresholds;
            stateSequence = -ones(length(data),1);
            currentState = 0;
            stepCount = 0;
            timestamp = [];
            for i = 1: length(data)
                %stateSequence(i) = currentState;
                nextState = self.StateTransition(data(i), currentState, transferThresholds);
                
                
                if (currentState == 6)&&(nextState == 0)
                    stepCount = stepCount + 1;
                    timestamp = [timestamp i];
                end
                
                currentState = nextState;
                stateSequence(i) = currentState;
                i;
                
            end
            
        end
        
        function nState = StateTransition(self, input, cState, transThresholds)
            
            thr = transThresholds(1);
            posPeakThr = transThresholds(2);
            negPeakThr = transThresholds(3);
            negThr = transThresholds(4);
            S0 = 0;
            S1 = 1;
            S2 = 2;
            S3 = 3;
            S4 = 4;
            S5 = 5;
            S6 = 6;
            
            switch cState
                case S0
                    if input > thr
                        nState = S1;
                    else
                        nState = S0;
                    end
                case S1
                    if input > posPeakThr
                        nState = S2;
                    elseif (input > thr)&&(input < posPeakThr)
                        nState = S1;
                    else
                        nState = S4;
                    end
                case S2
                    if input < negPeakThr
                        nState = S3;
                    elseif input > posPeakThr
                        nState = S2;
                    else
                        nState = S2;
                        %disp('State Transition Error');
                    end
                case S3
                    if input > negPeakThr
                        nState = S5;
                    else
                        nState = S3;
                    end
                case S4
                    if input > thr
                        nState = S1;
                    else
                        nState = S0;
                    end
                case S5
                    if input > negThr
                        nState = S6;
                    elseif (input > negPeakThr)&&(input < negThr)
                        nState = S5;
                    else
                        nState = S3;
                    end
                case S6
                    if input > thr
                        nState = S1;
                    else
                        nState = S0;
                    end
                otherwise
                    nState = cState;
            end
        end
        
    end %methods
end %classdef