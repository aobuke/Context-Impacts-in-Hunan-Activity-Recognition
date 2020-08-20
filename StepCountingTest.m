Parameters_h;
onRead = 1;

% 1 is PTM, 2 is STFT, 3 is FSM, 4 is DWT, 5 is DWT2
setMethod = 1;

if onRead == 1
    ReadStepData;
end

index = 1;
TPN = [];
FPN = [];
gTruth = [];
para.coef = 0;
para.N = 120;
para.mpd = 100;

if setMethod == 1 % PTM
    thresholds = 1:40;
    method = 'p';
    para.N = 0;
elseif setMethod == 2 % STFT
    thresholds = -10:10;
    method = 's';
elseif setMethod == 3 % FSM
    thresholds = 11:0.5:15;
    method = 'f';
elseif setMethod == 4 % DWT
    thresholds = -5:0.1:5;
    method = 'd';
elseif setMethod == 5 % DWT2
    thresholds = 10:10:100;
    method = 'D';
end



for thr =  thresholds
    tpN = [];
    fpN = [];
    for i = 1:54
        if (stepData{i}.inf.pl ~= WATCH)&&(stepData{i}.inf.pl ~= UPOC) % only for Group I.
            [gTruth(i), tpN(i), fpN(i)] = StepCalc(stepData{i},thr,2, method, para);
        end
    end
    TPN(index) = sum(tpN);
    FPN(index) = sum(fpN);
    index = index + 1;
end

[x,~,temp] = unique(FPN);
y=accumarray(temp,TPN, [], @max);
Num = sum(gTruth);
xFP = x/Num;
yTP = y/Num;
figure, plot(xFP(xFP<0.1),yTP(xFP<0.1),'-bo');
xlabel('False positive rate');
ylabel('True positive rate');


