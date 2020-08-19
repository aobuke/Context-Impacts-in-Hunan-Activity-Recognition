Parameters_h;

onRead = 1;
accuracyArrayWinSTFT = [];
accuracyArraySTFTDS = [];

onDownsample = false;
if onDownsample == false
    windowSizeList = 1:10;
    downsampleIndex = 1;
else
    windowSizeList = 4;
    downsampleIndex = 1:6;
end

for iWindowSizeList = windowSizeList
    window = WINDOWSIZELIST(iWindowSizeList);
    for iDownsampleIndex = downsampleIndex
        overlap =   floor(window/6); %100
        mkFrame = [window, overlap];
        disp('reading files');
        ReadData;
        fs = 200;
        
        % data selection
        index = (trainData(:,markXYZ) == MAXIS);
        index = index & (trainData(:,markSensor) == ACC);
        index = index & ((trainData(:,markActivity) == WK) | (trainData(:,markActivity) == RID) | (trainData(:,markActivity) == UPS) | (trainData(:,markActivity) == DWS) );
        %index = index & (trainData(:,markPlace) == FOO);
        %index = index & (trainData(:,markPeop) == ABK);
        data = trainData(index, 1:window);
        label = trainData(index, markActivity);
        labelEx = trainData(index, window+1:end);
        label(label ~= 1) = 2;
        
        data = data(:,1:DOWNSAMPLERATE(iDownsampleIndex):end);
        w = hann(size(data,2))';
        spec = bsxfun(@times, data, w);
        
        spec = abs(fft(spec'))';
        spec(:,1) = 0; % remove DC bias
        spec = spec(:,1:end/2);
        peak = max(spec,[],2);
        e1 = sum(spec(:,2:5),2); % 2:5 seems best
        e2 = sum(spec, 2);
        rmatrix = e1;
        
        accuracy = [];
        for thr = 0:1:5000
            recog = 2*ones([length(label),1]);
            recog((rmatrix(1:length(label)) < thr)) = 1;
            [c,~] = confusionmat(label,recog);
            accy = sum(recog==label)./length(label);
            accuracy = [accuracy;accy];
        end
        %plot(accuracy)
        msg = sprintf('\n accuracy is: %f', max(accuracy));
        disp(msg);
        if onDownsample == true
            accuracyArraySTFTDS(iDownsampleIndex) =  max(accuracy);
        else
            accuracyArrayWinSTFT(iWindowSizeList) =  max(accuracy);
        end
    end
end
