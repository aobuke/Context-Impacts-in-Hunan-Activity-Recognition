Parameters_h;
onRead = 1;
onECDF = 0;
onWhiten = 0;

accuracyArrayWinKNN = [];
accuracyArrayKNNDS = [];

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
        overlap =  floor(window/6) %100
        mkFrame = [window, overlap];
        disp('reading files');
        ReadData;
        
        % data selection
        %index = (trainData(:,markXYZ)==1) | (trainData(:,markXYZ)==3);
        index = (trainData(:,markXYZ) == MAXIS);
        index = index & (trainData(:,markSensor) == ACC);
        index = index & ((trainData(:,markActivity) == WK) | (trainData(:,markActivity) == RID) | (trainData(:,markActivity) == UPS) | (trainData(:,markActivity) == DWS) );
        %index = index & (trainData(:,markPlace) == HAND);
        %index = index & (trainData(:,markPeop) == ABK);
        data = trainData(index, 1:window);
        label = trainData(index, markActivity);
        labelEx = trainData(index, window+1:end);
        
        label(label ~= 1) = 2;
        
        selectedFeature = [9:15]; % 82% accuracy
        data = data(:,1:DOWNSAMPLERATE(iDownsampleIndex):end);
        featureData = FeatureGenerating(data, selectedFeature);
        
        if onECDF
            featureData = ones(size(data));
            for i = 1:size(data,1)
                [f, x] = ecdf(data(i,:));
                featureData(i,1:length(f)) = f';
            end
        end
        
        if onWhiten
            datax = data;
            for i = 1:size(datax,1)
                [x,y] = max(datax(i,:));
                datax(i,:) = circshift(datax(i,:)',350-y);
            end
            % I: by eig
            %[U,D] = eig(cov(datax));
            % II: by svd
            [U,S,V] = svd(cov(datax));
            featureData = U(:,[3,4,7,8,13,14])' * datax';
            featureData = featureData';
        end
        
        %   global label;
        %   c = cvpartition(label,'k',10);
        % opts = statset('display','iter');
        % fun = @(XT,yT,Xt,yt)...
        %       (sum(yt ~= knn(XT, Xt)));
        % [fs,history] = sequentialfs(fun, featureData, label,'cv',c,'options',opts);
        %   return;
        
        
        CVO = cvpartition(label,'k',10);
        err = zeros(CVO.NumTestSets,1);
        for i = 1:CVO.NumTestSets
            trIdx = CVO.training(i);
            teIdx = CVO.test(i);
            mdl = ClassificationKNN.fit(featureData(trIdx,:), label(trIdx,:),'NumNeighbors',5);
            testResult = predict(mdl, featureData(teIdx,:));
            err(i) = sum(testResult ~= label(teIdx));
            [c,~] = confusionmat(label(teIdx), testResult);
        end
        cvErr = sum(err)/sum(CVO.TestSize);
        accuracy = 1-cvErr;
        
        msg = sprintf('accuracy is: %f', accuracy);
        disp(msg);
        if onDownsample == true
            accuracyArrayKNNDS(iDownsampleIndex) =  accuracy;
        else
            accuracyArrayWinKNN(iWindowSizeList) =  accuracy;
        end
    end
end