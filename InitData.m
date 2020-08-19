classdef InitData
% load data from str
properties
    data = [];
    dataFile = [];
    fIMU = [];
    omegaIMU = [];
    win;
    overlap;
end %properties 

methods 
    function self = InitData(fileName, sel, upsample)
        index = [];
        
        self.dataFile = fopen(fileName, 'r');
        self.data = fscanf(self.dataFile, '%d:%d:%d  %f, %f, %f,  %f, %f, %f,  %f, %f, %f ', [12 inf])';
        fclose(self.dataFile);
        % remove data
        if exist('sel','var')
            temp = [];
            for i = 1:size(sel,2)
                 temp = cat(1, temp, self.data(sel(1,i):sel(2,i),:));
            end
            self.data = temp;
        end
        % get accelerometer 
        index = find((self.data(:,4)~=0)|(self.data(:,5)~=0)|(self.data(:,6)~=0));
        self.fIMU = self.data(index,4:6);
        % get gyrometer
        index = find((self.data(:,7)~=0)|(self.data(:,8)~=0)|(self.data(:,9)~=0));
        self.omegaIMU = self.data(index,7:9);
        % interplate for DT data, ASUS tablet 50Hz sensor
        if exist('upsample','var')
            ifIMU(:,1) = interp(self.fIMU(:,1),4);
            ifIMU(:,2) = interp(self.fIMU(:,2),4);
            ifIMU(:,3) = interp(self.fIMU(:,3),4);
            iomegaIMU(:,1) = interp(self.omegaIMU(:,1),4);
            iomegaIMU(:,2) = interp(self.omegaIMU(:,2),4);
            iomegaIMU(:,3) = interp(self.omegaIMU(:,3),4);
            self.fIMU = ifIMU;
            self.omegaIMU = iomegaIMU;
        end
        % filter
        b = fir1(10, 0.1);
        self.fIMU = filter(b, 1, self.fIMU);
        self.omegaIMU = filter(b,1, self.omegaIMU);
        
        fprintf('.');
    end
    function trainData = Addto(self,trainData, mkFrame, sensorID, flag)
        % mkFrame = [window, overlap]
        %     data      |xyz|placement|Activity|sensor
        % flag = [placement, Activity]
        if sensorID == 1
            [dataX, dataY, dataZ, fNum] = Buffer3D(self.fIMU, mkFrame(1), mkFrame(2));
            if  sum(dataX(end,:)==0) > (mkFrame(1)/6)
                dataX = dataX(1:end-1,:);
                dataY = dataY(1:end-1,:);
                dataZ = dataZ(1:end-1,:);
                fNum = fNum - 1;
            end
            mag = sqrt(dataX.^2 + dataY.^2 + dataZ.^2);
            trainData = Append(trainData, dataX, [1,1,flag]);
            trainData = Append(trainData, dataY, [2,1,flag]);
            trainData = Append(trainData, dataZ, [3,1,flag]);
            trainData = Append(trainData, mag,   [4,1,flag]);
        end
        if sensorID == 2
            [dataX, dataY, dataZ, fNum] = Buffer3D(self.omegaIMU, mkFrame(1), mkFrame(2));
            if  sum(dataX(end,:)==0) > (mkFrame(1)/6)
                dataX = dataX(1:end-1,:);
                dataY = dataY(1:end-1,:);
                dataZ = dataZ(1:end-1,:);
                fNum = fNum - 1;
            end
            mag = sqrt(dataX.^2 + dataY.^2 + dataZ.^2);
            trainData = Append(trainData, dataX, [1,2,flag]);
            trainData = Append(trainData, dataY, [2,2,flag]);
            trainData = Append(trainData, dataZ, [3,2,flag]);
            trainData = Append(trainData, mag,   [4,2,flag]);
        end
    end
    
    function episode = StepC(self, mkSC) %20 steps
        MAG = @(x) sqrt(sum(x.^2,2));
        episode = self.fIMU(mkSC(1):mkSC(2),:);
        global percentC;
        global scaleC;
        b = fir1(5, 0.15);
        episode = filter(b, 1, episode);
       % episode = PreProcessSC(episode, percentC, scaleC);
%        episode = MAG(episode(5:end,:));
%        
%        m = mean(episode);
%        k = 20/(max(episode)-min(episode));
%        episode = k*(episode-m) + m;
    end

     function View(self, len, dim)
         if nargin < 3
             len = length(self.fIMU);
             dim = 1;
         end
         plot(self.fIMU(1:len, dim));
     end


end %methods

end %InitData