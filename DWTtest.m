Parameters_h;
onRead = 1;

accuracyArrayWinDWT = [];
accuracyArrayDWTDS = [];

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
        
        
        % STFT test
        fs = 200;
        
        
        % data selection
        %index = (trainData(:,markXYZ)==1) | (trainData(:,markXYZ)==3);
        index = (trainData(:,markXYZ) == MAXIS);
        index = index & (trainData(:,markSensor) == ACC);
        index = index & ((trainData(:,markActivity) == WK) | (trainData(:,markActivity) == RID) | (trainData(:,markActivity) == UPS) | (trainData(:,markActivity) == DWS) );
        %index = index & (trainData(:,markPlace) == FOO);
        %index = index & (trainData(:,markPeop) == ABK);
        data = trainData(index, 1:window);
        label = trainData(index, markActivity);
        labelEx = trainData(index, window+1:end);
        label(label ~= 1) = 2;
        
        accuracyArrayDWT = [];
        
        data = data(:,1:DOWNSAMPLERATE(iDownsampleIndex):end);
        
        for e = floor(size(data,2)/3)
            if 1
                ratioMtx = [];
                clear dwt;
                for i = 1:size(data,1)
                    dwt = DWT(data(i,:), 0, 8);
                    dwt.run(e);
                    ratioMtx(i,:) = (dwt.ratioMatrix);
                    
                end
            end
            
            
            rmatrix = mean(ratioMtx,2);
            accuracy = [];
            for thr = 0:0.01:5
                
                recog = 2*ones([length(label),1]);
                recog((rmatrix(1:length(label)) < thr)) = 1;
                [c,~] = confusionmat(label,recog);
                accy = sum(recog==label)./length(label);
                accuracy = [accuracy;accy];
            end
            %plot(accuracy);
            accuracyArrayDWT = [accuracyArrayDWT, max(accuracy)];
        end
        msg = sprintf('\n accuracy is: %f', max(accuracy));
        disp(msg);
        if onDownsample == true
            accuracyArrayDWTDS(iDownsampleIndex) =  max(accuracy);
        else
            accuracyArrayWinDWT(iWindowSizeList) =  max(accuracy);
        end
        
    end
end
