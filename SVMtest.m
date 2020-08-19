Parameters_h;

onRead = 1;
onPCA = 0;
onWhiten = 0;

accuracyArrayWinSVM = [];
accuracyArraySVMDS = [];

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
        overlap =   floor((300:100:1200)/6); %100
        mkFrame = [window, overlap];
        disp('reading files');
        ReadData;
        % data selection
        index = (trainData(:,markXYZ) == MAXIS);
        index = index & (trainData(:,markSensor) == ACC);
        index = index & ((trainData(:,markActivity) == WK) | (trainData(:,markActivity) == RID) | (trainData(:,markActivity) == UPS) | (trainData(:,markActivity) == DWS) );
        %index = index & (trainData(:,markPeop) == ABK);
        data = trainData(index, 1:window);
        label = trainData(index, markActivity);
        
        % adapt label to 2-class SVM
        label(label ~= 1) = 2;
        selectedFeature = [1:12];
        data = data(:,1:DOWNSAMPLERATE(iDownsampleIndex):end);
        featureData = FeatureGenerating(data, selectedFeature);
        
        if onPCA
            datax = data;
            for i = 1:size(datax,1)
                [x,y] = max(datax(i,:));
                datax(i,:) = circshift(datax(i,:)',350-y);
            end
            [pc,score,latent,tsquare] = princomp(datax);
            featureData = score(:,1:2);
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
        
        
        CVO = cvpartition(label,'k',10);
        err = zeros(CVO.NumTestSets,1);
        for i = 1:CVO.NumTestSets
            trIdx = CVO.training(i);
            teIdx = CVO.test(i);
            if 0
                svmStruct = svmtrain(featureData(trIdx, :), label(trIdx),'ShowPlot',true);
            else
                options = optimset('maxiter',Inf);
                svmStruct = fitcsvm(featureData(trIdx, :), label(trIdx),'Standardize', true, 'KernelFunction', 'RBF');
            end
            testResult = predict(svmStruct, featureData(teIdx, :));
            [c,~] = confusionmat(label(teIdx),testResult);
            err(i) = sum(testResult ~= label(teIdx));
            accy(i) = 1-err(i)/sum(teIdx);
        end
        cvErr = sum(err)/sum(CVO.TestSize);
        accuracy = 1-cvErr;
        msg = sprintf('accuracy is: %f', accuracy);
        disp(msg);
        if onDownsample == true
            accuracyArraySVMDS(iDownsampleIndex) =  accuracy;
        else
            accuracyArrayWinSVM(iWindowSizeList) =  accuracy;
        end
    end
end