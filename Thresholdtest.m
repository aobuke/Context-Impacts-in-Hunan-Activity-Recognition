
Parameters_h;
onRead = 1;

accuracyArrayWinTHR=[];
accuracyArrayTHRDS = [];

onDownsample = true;
if onDownsample == false
    windowSizeList = 1:10;
    downsampleIndex = 1;
else
    windowSizeList = 4;
    downsampleIndex = 1:6;
end

for i = windowSizeList
    window = WINDOWSIZELIST(i); 
    for iDownSample = downsampleIndex
        overlap = floor(window/6); %100
        mkFrame = [window, overlap];
        disp('reading files');
        ReadData;
        
        index = (trainData(:,markXYZ) == MAXIS);
        index = index & (trainData(:,markSensor) == ACC);
        index = index & ((trainData(:,markActivity) == WK) | (trainData(:,markActivity) == RID) | (trainData(:,markActivity) == UPS) | (trainData(:,markActivity) == DWS) );
        %index = index & (trainData(:,markPlace) == FOO);
        %index = index & (trainData(:,markPeop) == ABK);
        data = trainData(index, 1:window);
        label = trainData(index, markActivity);
        labelEx = trainData(index, window+1:end);
        
        label(label ~= 1) = 2;
        data = data(:,1:DOWNSAMPLERATE(iDownSample):end);
        selectedFeature = [1:7];
        featureData = FeatureGenerating(data, selectedFeature);
       
        rmatrix = featureData(:,2);
        accuracy = [];
        for thr = 1:50
            recog = 2*ones([length(label),1]);
            recog((rmatrix(1:length(label))<thr)) = 1; % 8 - accy.max
            [c,~] = confusionmat(label,recog);
            accy = sum(recog==label)./length(label);
            accuracy = [accuracy;accy];
        end
        
        %plot(accuracy)
        msg = sprintf('accuracy is: %f', max(accuracy));
        disp(msg);
        
        if onDownsample == true
            accuracyArrayTHRDS = [accuracyArrayTHRDS max(accuracy)];
        else
            accuracyArrayWinTHR = [accuracyArrayWinTHR max(accuracy)];
        end
    end
end
