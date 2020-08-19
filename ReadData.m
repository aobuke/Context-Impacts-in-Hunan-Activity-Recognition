% training data | Mark
%     data      |xyz|placement|Activity|sensor
markXYZ = window + 1;
markSensor = window + 2;
markPlace = window + 3;
markActivity = window + 4;
markPeop = window + 5;


if onRead
    trainData = [];
    % Add first
    % para3=1: accelerometer, =2: gyroscope
    % para4= [placement, Activity]
    data = InitData('./data1/dataFoot.txt');
    trainData = data.Addto(trainData, mkFrame, ACC, [FOO,WK,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [FOO,WK,ABK]);
    % Add first
    %     data      |xyz|placement|Activity|sensor
    data = InitData('./data1/dataZTFoot2.txt',[26100,54230;35480,62130]);
    trainData = data.Addto(trainData, mkFrame, ACC, [FOO,WK,ZT]);
    trainData = data.Addto(trainData, mkFrame, GYR, [FOO,WK,ZT]);
    data = InitData('./data1/dataZTFoot2.txt',[676;19440]);
    trainData = data.Addto(trainData, mkFrame, ACC, [FOO,UPS,ZT]);
    trainData = data.Addto(trainData, mkFrame, GYR, [FOO,UPS,ZT]);
    data = InitData('./data1/dataZTFoot2.txt',[37140;51640]);
    trainData = data.Addto(trainData, mkFrame, ACC, [FOO,DWS,ZT]);
    trainData = data.Addto(trainData, mkFrame, GYR, [FOO,DWS,ZT]);
    % Add
    %     data      |xyz|placement|Activity|sensor
    data = InitData('./data1/RightPocketLineWalking.txt');
    trainData = data.Addto(trainData, mkFrame, ACC, [POC,WK,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [POC,WK,ABK]);
    % Add
    %     data      |xyz|placement|Activity|sensor
    data = InitData('./data1/dataZTPocket2.txt',[26770,53790;34150,61550]);
    trainData = data.Addto(trainData, mkFrame, ACC, [POC,WK,ZT]);
    trainData = data.Addto(trainData, mkFrame, GYR, [POC,WK,ZT]);
    data = InitData('./data1/dataZTPocket2.txt',[2290;20110]);
    trainData = data.Addto(trainData, mkFrame, ACC, [POC,UPS,ZT]);
    trainData = data.Addto(trainData, mkFrame, GYR, [POC,UPS,ZT]);
    data = InitData('./data1/dataZTPocket2.txt',[37410;51400]);
    trainData = data.Addto(trainData, mkFrame, ACC, [POC,DWS,ZT]);
    trainData = data.Addto(trainData, mkFrame, GYR, [POC,DWS,ZT]);
    % Add
    %     data      |xyz|placement|Activity|sensor
    data = InitData('./data1/dataPannianWalk.txt',[10000;20000]);
    trainData = data.Addto(trainData, mkFrame, ACC, [POC,WK,PAN]);
    trainData = data.Addto(trainData, mkFrame, GYR, [POC,WK,PAN]);
    % Add
    %     data      |xyz|placement|Activity|sensor
    data = InitData('./data1/dataPocketDatangCirc.txt',[1400;82000]);
    trainData = data.Addto(trainData, mkFrame, ACC, [POC,WK,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [POC,WK,ABK]);
    % Add second
    for i = 1:2
        %     data      |xyz|placement|Activity|sensor
        data = InitData('./data1/dataRiding.txt',[1400;5000]);
        trainData = data.Addto(trainData, mkFrame, ACC, [POC,RID,ABK]);
        trainData = data.Addto(trainData, mkFrame, GYR, [POC,RID,ABK]);
        % Add second
        %     data      |xyz|placement|Activity|sensor
        data = InitData('./data1/dataOffWork.txt',[1600,37200;26000,54450]);
        trainData = data.Addto(trainData, mkFrame, ACC, [POC,RID,ABK]);
        trainData = data.Addto(trainData, mkFrame, GYR, [POC,RID,ABK]);
    end
    for i= 1:8
        % Add
        %     data      |xyz|placement|Activity|sensor
        data = InitData('./data1/dataUpStairs.txt',[400;4000]);
        trainData = data.Addto(trainData, mkFrame, ACC, [POC,UPS,ABK]);
        trainData = data.Addto(trainData, mkFrame, GYR, [POC,UPS,ABK]);
        % Add
        %     data      |xyz|placement|Activity|sensor
        data = InitData('./data1/dataPocketUpstairs15.txt',[1;5600]);
        trainData = data.Addto(trainData, mkFrame, ACC, [POC,UPS,ABK]);
        trainData = data.Addto(trainData, mkFrame, GYR, [POC,UPS,ABK]);
    end
    for i = 1:5
        % Add
        %     data      |xyz|placement|Activity|sensor
        data = InitData('./data1/dataDownStairs12.txt',[1800;22290]);
        trainData = data.Addto(trainData, mkFrame, ACC, [POC,DWS,ABK]);
        trainData = data.Addto(trainData, mkFrame, GYR, [POC,DWS,ABK]);
    end
    
    % Add
    %     data      |xyz|placement|Activity|sensor
    data = InitData('./data1/dataABKFoot3.txt',[29250,64390;39270,71250]);
    trainData = data.Addto(trainData, mkFrame, ACC, [FOO,WK,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [FOO,WK,ABK]);
    data = InitData('./data1/dataABKFoot3.txt',[3753;20140]);
    trainData = data.Addto(trainData, mkFrame, ACC, [FOO,UPS,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [FOO,UPS,ABK]);
    data = InitData('./data1/dataABKFoot3.txt',[44460;59380 ]);
    trainData = data.Addto(trainData, mkFrame, ACC, [FOO,DWS,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [FOO,DWS,ABK]);
    % Add
    %     data      |xyz|placement|Activity|sensor
    %although only 37810 points, sampling rate is 200hz
    data = InitData('./data1/dataABKUPoc.txt',[11060,31160;19050,37810]);
    trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,WK,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,WK,ABK]);
    data = InitData('./data1/dataABKUPoc.txt',[1632;7779]);
    trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,UPS,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,UPS,ABK]);
    data = InitData('./data1/dataABKUPoc.txt',[22030;27550 ]);
    trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,DWS,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,DWS,ABK]);
    % Add
    %     data      |xyz|placement|Activity|sensor
    data = InitData('./data1/dataABKPocket3.txt',[26090,59820;35680,66380]);
    trainData = data.Addto(trainData, mkFrame, ACC, [POC,WK,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [POC,WK,ABK]);
    data = InitData('./data1/dataABKPocket3.txt',[1549;17330]);
    trainData = data.Addto(trainData, mkFrame, ACC, [POC,UPS,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [POC,UPS,ABK]);
    data = InitData('./data1/dataABKPocket3.txt',[40620;55080 ]);
    trainData = data.Addto(trainData, mkFrame, ACC, [POC,DWS,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [POC,DWS,ABK]);
    % Add
    %     data      |xyz|placement|Activity|sensor
    data = InitData('./data1/dataABKBkPoc.txt',[11860,31300;19660,37820]);
    trainData = data.Addto(trainData, mkFrame, ACC, [BPOC,WK,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [BPOC,WK,ABK]);
    data = InitData('./data1/dataABKBkPoc.txt',[2667;8773]);
    trainData = data.Addto(trainData, mkFrame, ACC, [BPOC,UPS,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [BPOC,UPS,ABK]);
    data = InitData('./data1/dataABKBkPoc.txt',[22490;27950 ]);
    trainData = data.Addto(trainData, mkFrame, ACC, [BPOC,DWS,ABK]);
    trainData = data.Addto(trainData, mkFrame, GYR, [BPOC,DWS,ABK]);
    
    Read6PeopleData;
    
    
    if balanceData
        % balance training dataset
        index = (trainData(:,markActivity) == RID);
        for i = 1:4
            trainData = cat(1, trainData, trainData(index,:));
        end
        
        index = (trainData(:,markActivity) == UPS) ;
        trainData = cat(1, trainData, trainData(index,:));
        index = (trainData(:,markActivity) == DWS) ;
        trainData = cat(1, trainData, trainData(index,:));
    end
end