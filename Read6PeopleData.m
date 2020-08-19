% Read the data of 6 persons
%Parameters_h;

MAG = @(x) sqrt(sum(x.^2,2));
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(75).txt',[13380,32340;21630,42400]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(75).txt',[4000;10800]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(75).txt',[24120;30650]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,DWS,SUB]);
% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data76.txt',[16130,35760;24760,46000]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data76.txt',[6440;13600]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data76.txt',[27530;34020]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,DWS,SUB]);
% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(76).txt',[14420,33510;22980,42400]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(76).txt',[6197;12580]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(76).txt',[25290;31700]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,DWS,SUB]);
% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(77).txt',[15540,33610;23080,42030]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(77).txt',[6719;13340]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(77).txt',[24800;31480]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,DWS,SUB]);
% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data77.txt',[13640,32400;21750,41240]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data77.txt',[4521;11450]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data77.txt',[23950;30290]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,DWS,SUB]);

% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(78).txt',[19200,39670;27580,48670]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(78).txt',[9263;16640]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(78).txt',[30900;37280]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,DWS,SUB]);
% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data78.txt',[15650,37890;25450,47210]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [WATCH,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [WATCH,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data78.txt',[8492;13750]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [WATCH,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [WATCH,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data78.txt',[28690;35380]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [WATCH,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [WATCH,DWS,SUB]);

% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(79).txt',[19200,39670;27580,48670]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(79).txt',[9263;16640]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(79).txt',[30900;37280]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,DWS,SUB]);
% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data79.txt',[14200,36060;23740,46640]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [POC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data79.txt',[5089;12160]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [POC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data79.txt',[26860;33740]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [POC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,DWS,SUB]);

% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(80).txt',[24890,49150;34910,57980]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [BPOC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [BPOC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(80).txt',[15720;22970]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [BPOC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [BPOC,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(80).txt',[38070;44450]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [BPOC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [BPOC,DWS,SUB]);
% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data80.txt',[22480,47410;32690,56740]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data80.txt',[12840;20330]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data80.txt',[36040;42570]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,DWS,SUB]);

% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(81).txt',[17970,38810;25990,46490]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(81).txt',[7721;14560]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(81).txt',[30000;35750]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,DWS,SUB]);
% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data81.txt',[16050,37720;24600,45360]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data81.txt',[5577;12690]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data81.txt',[28530;34620]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,DWS,SUB]);






% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataLYBBkPocket.txt',[4348;6021],4); % ASUS
trainData = data.Addto(trainData, mkFrame, ACC, [BPOC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [BPOC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataLYBBkPocket.txt',[1171;4039],4); % ASUS
trainData = data.Addto(trainData, mkFrame, ACC, [BPOC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [BPOC,UPS,SUB]);
% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataLYBUPocket.txt',[13130;19640]); % SONY
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataLYBUPocket.txt',[2772;12060]); % SONY
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,UPS,SUB]);


% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataXJfrontpocket.txt',[9620,27700;19950,34680]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataXJfrontpocket.txt',[2726;8638]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataXJfrontpocket.txt',[20430;27060]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [POC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [POC,DWS,SUB]);
% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataXJUPocket.txt',[2738,7876;5724,9554],4); % ASUS
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataXJUPocket.txt',[1108;2692],4); % ASUS
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataXJUPocket.txt',[6060;7550],4); % ASUS
trainData = data.Addto(trainData, mkFrame, ACC, [UPOC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [UPOC,DWS,SUB]);



% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataXJwatchlefthand.txt',[10090,27160;17890,33950]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [WATCH,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [WATCH,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataXJwatchlefthand.txt',[2670;9350]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [WATCH,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [WATCH,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataXJwatchlefthand.txt',[19840;25840]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [WATCH,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [WATCH,DWS,SUB]);
% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataXJhold.txt',[3775,7776;5507,9752],4); % ASUS
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataXJhold.txt',[1576;3240],4); % ASUS
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,UPS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,UPS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./datafromDT/dataXJhold.txt',[6086;7631],4); % ASUS
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,DWS,SUB]);


















% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(82).txt',[14110,34710;23810,42290]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,WK,ZT]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,WK,ZT]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(82).txt',[3912;10830]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,UPS,ZT]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,UPS,ZT]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/data(82).txt',[27070;32690]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,DWS,ZT]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,DWS,ZT]);
% Add ---------------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/dataZTNexusWATCH.txt',[14470,35800;24130,43370]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [WATCH,WK,ZT]);
trainData = data.Addto(trainData, mkFrame, GYR, [WATCH,WK,ZT]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/dataZTNexusWATCH.txt',[3777;11200]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [WATCH,UPS,ZT]);
trainData = data.Addto(trainData, mkFrame, GYR, [WATCH,UPS,ZT]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/dataZTNexusWATCH.txt',[27960;33740]); % Nexus
trainData = data.Addto(trainData, mkFrame, ACC, [WATCH,DWS,ZT]);
trainData = data.Addto(trainData, mkFrame, GYR, [WATCH,DWS,ZT]);


% Add ---------Zhang YancChao------------------------------------------------------
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/dataZYCdws.wk.hd.wtch.txt',[1286;8267]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [BPOC,DWS,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [BPOC,DWS,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/dataZYCdws.wk.hd.wtch.txt',[25000;33000]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [BPOC,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [BPOC,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/dataZYCdws.wk.hd.wtch.txt',[44000;51000]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [HAND,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [HAND,WK,SUB]);
% Add 
%     data      |xyz|placement|Activity|sensor
data = InitData('./6People/dataZYCdws.wk.hd.wtch.txt',[100000;108000]); % Sony
trainData = data.Addto(trainData, mkFrame, ACC, [WATCH,WK,SUB]);
trainData = data.Addto(trainData, mkFrame, GYR, [WATCH,WK,SUB]);

%