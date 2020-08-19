classdef PTM
    properties
        data = [];
        LowPassFilterOrder = [];
        LowPassFilterFreq = [];
        mY = 0;
        mY1 = [];
        mY2 = [];
        mY3 = [];
        
    end %properties
    
    methods
        function self = PTM(input)
            self.data = input;
            self.LowPassFilterOrder = 200;
            self.LowPassFilterFreq = 0.25;
        end
        
        function self = Run(self, para)
            fIMU = self.data;
            % Lowpass/Bandpass Filter
            b = fir1(self.LowPassFilterOrder, self.LowPassFilterFreq);
            
            
            y = filter(b, 1, fIMU);
            s = self.LowPassFilterOrder/2 +1;
            y = [y(s:end); y(end)*ones(s-1,1)]; % remove filter delay
            % Derivative operator
            if 0 %HAND
                y1 = y-mean(y);
                y2 = y1.^2;
                y3 = y2;
            else
                
                %y1 = filter([0.25, 0.125, -0.125, -0.25], 1, y);
                % for placed at hand
                if para.coef == 0
                    coef = [0.25, 0.25, 0.25, 0.25, 0.25,-0.25,-0.25, -0.25, -0.25, -0.25];
                else
                    coef = para.coef;
                end
                y1 = filter(coef, 1, y);
                
                % Squaring
                y2 = y1.^2;
                
                y2 = y2 * 20/std(y2);
                
                % Integration
                if para.N == 0
                    N = 100;%75; %original is 20
                else
                    N = para.N;
                end
                
                %         y3 = [];
                %         for i = N+1:length(y2)
                %                 y3(i,:) = mean(y2(i-N:i,:));
                %         end
                y3  = filter(ones(N,1), 1, y2)/N;
            end
            self.mY = y;
            self.mY1 = y1;
            self.mY2 = y2;
            self.mY3 = y3;
            
        end
        function View(self)
            fIMU = self.data;
            figure,
            subplot(4,1,1),plot(self.mY(:,1)), hold on, plot(self.mY1(:,1), '-r'),hold off;
            subplot(4,1,2),plot(self.mY1(:,1)), hold on, plot(self.mY2(:,1),'-r'),hold off;
            subplot(4,1,3),plot(self.mY2(:,1)), hold on, plot(self.mY3(:,1),'-r'),hold off;
            subplot(4,1,4),plot(fIMU(:,1)./max(fIMU(:,1))), hold on, plot(self.mY3(100:end,1)./max(self.mY3(100:end,1)),'-r'), hold off; %normalize
        end  
    end %methods
end %classdef