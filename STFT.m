classdef STFT < handle
    % This class is the energy-based ShortFFT of University of Washington,
    % Ubicomp
    properties
        thr = [];
        data = [];
        accMagnitudeReconstructD = [];
    end %properties
    
    methods
        function self = STFT(input, threshold)
            self.thr = threshold;
            self.data = input;
        end
        
        function [spec, accMagnitudeReconstruct]  = run(self)
            %global stftPara;
            accMagnitude = self.data;
            spec = fft(accMagnitude);
            spec(1) = 0; % zero DC component
            
            accMagnitudeSpecAbs = abs(spec); % add .^2 when pl = hand
            
            threshold = sum(accMagnitudeSpecAbs) * self.thr;
            curEnergy = 0;
            position = 0;
            for i = 1:length(accMagnitudeSpecAbs)
                curEnergy = curEnergy + accMagnitudeSpecAbs(i);
                if (curEnergy > threshold)
                    position = i;
                    break;
                end
            end
            %position = 100;
            spec(position: length(accMagnitudeSpecAbs)-position+2) = 0;
            accMagnitudeReconstruct = ifft(spec);
            % Derivative operator
            self.accMagnitudeReconstructD= filter([0.1000    0.3000    0.3000   -0.2000   -0.3000   -0.3000], 1, accMagnitudeReconstruct);

        end
    end %methods
end %classdef