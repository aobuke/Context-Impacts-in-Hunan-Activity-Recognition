stepData = {};
item = [];
data = InitData('./data1/dataFoot.txt');
stepBreakPoint = [5454,5760,6055,6349,6654,6960,7253,7546,7842,8140,8442,8821,9082,9326,9571,9816,10062,10308,10308,10552,10790,11032,11274,11516,11753,11989,12228,12459,12699,13178,13399,12939,13699,13995,14273,14547,14819,15092,15360,15623,15895,16178,16448,16730,16999,17265,17576];
stepBreakPoint = sort(stepBreakPoint);

item.axis = data.fIMU;
item.sbp = stepBreakPoint;
item.inf  = struct('user',ABK, 'pl', FOO, 'stepEst', 0);
stepData(1) = {item};

data = InitData('./data1/dataZTFoot2.txt');
stepBreakPoint = [26143,26363,26563,26770,26981,27186,27393,27606,27806,28014,28223,28433,28644,28850,29060,29265,29469,29679,29881,30083,30290,30497,30707,30910,31118,31327,31535,31745,31955,32165,32372,32584,32792,33003,33212,33428,33648,33867,34105,54279,54501,54710,54920,55125,55308,55540,55751,55960,56175,56389,56596,56804,57014,57223,57434,57649,57865,58077,58286,58479,58701,58911,59117,59317,59732,59935,60144,60352,60558,60775,60981,61196,61443,61654,61882,62050];
stepBreakPoint = sort(stepBreakPoint);
stepBreakPoint1 = stepBreakPoint(1:39);
stepBreakPoint2 = stepBreakPoint(40:end);

item.axis = data.fIMU;
item.sbp = stepBreakPoint1;
item.inf  = struct('user',ZT, 'pl', FOO, 'stepEst', 0);
stepData(2) = {item};

item.axis = data.fIMU;
item.sbp = stepBreakPoint2;
item.inf  = struct('user',ZT, 'pl', FOO, 'stepEst', 0);
stepData(3) = {item};

data = InitData('./data1/dataABKFoot3.txt');
stepBreakPoint = [29242,29583,29840,30031,30303,30524,30760,30987,31260,31482,31731,31953,32188,32436,32677,32914,33163,33416,33679,33930,34176,34383,34664,34938,35178,35411,35622,35899,36108,36335,36600,36838,37042,37310,37543,37740,37989,38254,38474,38693,38940,39184,64450,64720,64967,65200,65406,65663,65876,66088,66320,66522,66774,66996,67189,67424,67634,67854,68062,68284,68499,68737,68926,69176,69398,69585,69802,70046,70254,70475,70681,70917,71159];
stepBreakPoint = sort(stepBreakPoint);
stepBreakPoint1 = stepBreakPoint(1:42);
stepBreakPoint2 = stepBreakPoint(43:end);

item.axis = data.fIMU;
item.sbp = stepBreakPoint1;
item.inf  = struct('user',ABK, 'pl', FOO, 'stepEst', 0);
stepData(4) = {item};

item.axis = data.fIMU;
item.sbp = stepBreakPoint2;
item.inf  = struct('user',ABK, 'pl', FOO, 'stepEst', 0);
stepData(5) = {item};


data = InitData('./data1/dataABKPocket3.txt');
stepBreakPoint = [26134,26374,26607,26832,27060,27282,27507,27736,27973,28203,28435,28657,28887,29113,29338,29580,29817,30054,30299,30534,30780,31027,31267,31497,31712,31958,32158,32423,32651,32876,33110,33341,33548,33784,34010,34236,34460,34682,34904,35131,35356,35655,59844,60144,60363,60571,60779,61004,61218,61432,61658,61871,62078,62294,62478,62700,62923,63105,63343,63551,63759,63968,64190,64392,64600,64825,65032,65228,65424,65650,65872,66080,66329];
stepBreakPoint = sort(stepBreakPoint);
stepBreakPoint1 = stepBreakPoint(1:42);
stepBreakPoint2 = stepBreakPoint(43:end);

item.axis = data.fIMU;
item.sbp = stepBreakPoint1;
item.inf  = struct('user',ABK, 'pl', POC, 'stepEst', 0);
stepData(6) = {item};

item.axis = data.fIMU;
item.sbp = stepBreakPoint2;
item.inf  = struct('user',ABK, 'pl', POC, 'stepEst', 0);
stepData(7) = {item};

data = InitData('./data1/dataABKBkPoc.txt');
stepBreakPoint = [12090,12311,12512,12717,12920,13126,13327,13527,13726,13931,14132,14332,14533,14737,14940,15136,15340,15540,15740,15943,16142,16345,16549,16751,16953,17152,17350,17554,17754,17962,18164,18365,18567,18774,18977,19184,19405,31503,31738,31932,32145,32354,32560,32768,32977,33184,33388,33597,33808,34014,34223,34431,34638,34841,35043,35253,35461,35660,35866,36065,36271,36473,36668,36880,37085,37294,37523];
stepBreakPoint = sort(stepBreakPoint);
stepBreakPoint1 = stepBreakPoint(1:37);
stepBreakPoint2 = stepBreakPoint(38:end);

item.axis = data.fIMU;
item.sbp = stepBreakPoint1;
item.inf  = struct('user',ABK, 'pl', BPOC, 'stepEst', 0);
stepData(8) = {item};

item.axis = data.fIMU;
item.sbp = stepBreakPoint2;
item.inf  = struct('user',ABK, 'pl', BPOC, 'stepEst', 0);
stepData(9) = {item};


data = InitData('./data1/dataABKUPoc.txt');
stepBreakPoint = [11087,11407,11617,11825,12042,12255,12468,12669,12884,13090,13291,13503,13708,13931,14133,14349,14552,14757,14968,15173,15383,15594,15797,16011,16230,16425,16643,16846,17059,17266,17474,17692,17898,18106,18327,18543,18744,19024,31281,31543,31753,31966,32174,32409,32619,32827,33045,33261,33468,33690,33903,34124,34333,34545,34760,34985,35189,35395,35620,35831,36038,36252,36459,36669,37092,37311,37530,37813];
stepBreakPoint = sort(stepBreakPoint);
stepBreakPoint1 = stepBreakPoint(1:38);
stepBreakPoint2 = stepBreakPoint(39:end);

item.axis = data.fIMU;
item.sbp = stepBreakPoint1;
item.inf  = struct('user',ABK, 'pl', UPOC, 'stepEst', 0);
stepData(10) = {item};

item.axis = data.fIMU;
item.sbp = stepBreakPoint2;
item.inf  = struct('user',ABK, 'pl', UPOC, 'stepEst', 0);
stepData(11) = {item};

data = InitData('./JuneData/dataabkhandd.txt');
stepBreakPoint = [12172,12352,12531,12768,13053,13234,13466,13713,13897,14121,14363,14582,14773,14996,15254,15474,15728,15922,16095,16322,16552,16766,16990,17217,17430,17665,17880,18081,18285,18531,18750,18961,19193,19416,19675,19856,20071,20299,20597,20813,21016,36061,36221,36475,36664,36907,37130,37350,37572,37774,38009,38203,38462,38657,38890,39102,39304,39552,39767,39965,40202,40390,40601,40830,41069,41287,41508,41718,41934,42130,42342,42587,42801,43017,43226,43447,43643,43883,44098,44316,44538,44757,44983,45211];
stepBreakPoint = sort(stepBreakPoint);
stepBreakPoint1 = stepBreakPoint(1:41);
stepBreakPoint2 = stepBreakPoint(42:end);

item.axis = data.fIMU;
item.sbp = stepBreakPoint1;
item.inf  = struct('user',ABK, 'pl', HAND, 'stepEst', 0);
stepData(12) = {item};

item.axis = data.fIMU;
item.sbp = stepBreakPoint2;
item.inf  = struct('user',ABK, 'pl', HAND, 'stepEst', 0);
stepData(13) = {item};

load StepCountingReadPTM1; %diff(StepCountingReadPTM1,StepCountingReadPTM) is the last three point of stepIndex
stepBreakPoint = sort(stepIndex);
cursor = [1,21,42,63,84,104,124,145,166,187,208,229,250,271,292,313,334,355,366,376,387,404,425,446,467,488,509,530,551,572,592,613]
for i = 1:31
    if i==1
        stepBreakPoint = stepIndex(cursor(i):cursor(i+1));
    else
        stepBreakPoint = stepIndex(1+cursor(i):cursor(i+1));
    end
    istart = stepBreakPoint(1);
    iend = stepBreakPoint(end);
    item.axis = stepData0(istart:iend,:);
    item.sbp = stepBreakPoint - stepBreakPoint(1) + 1;
    %end
    stepData(13+i) = {item};
end
stepData{14}.inf = struct('user',ABK, 'pl', FOO, 'stepEst', 0);
stepData{15}.inf = struct('user',ZT, 'pl', FOO, 'stepEst', 0);

stepData{16}.inf = struct('user',ZT, 'pl', POC, 'stepEst', 0);
stepData{17}.inf = struct('user',PAN, 'pl', POC, 'stepEst', 0);
stepData{18}.inf = struct('user',ABK, 'pl', POC, 'stepEst', 0);
stepData{19}.inf = struct('user',ABK, 'pl', POC, 'stepEst', 0);
stepData{20}.inf = struct('user',SUB, 'pl', POC, 'stepEst', 0);
stepData{21}.inf = struct('user',SUB, 'pl', POC, 'stepEst', 0);
stepData{22}.inf = struct('user',SUB, 'pl', POC, 'stepEst', 0);
stepData{23}.inf = struct('user',SUB, 'pl', POC, 'stepEst', 0);
stepData{24}.inf = struct('user',SUB, 'pl', POC, 'stepEst', 0);%XIONGJUN
stepData{25}.inf = struct('user',SUB, 'pl', POC, 'stepEst', 0);

stepData{26}.inf = struct('user',SUB, 'pl', BPOC, 'stepEst', 0);
stepData{27}.inf = struct('user',SUB, 'pl', BPOC, 'stepEst', 0);
stepData{28}.inf = struct('user',SUB, 'pl', BPOC, 'stepEst', 0);
stepData{29}.inf = struct('user',SUB, 'pl', BPOC, 'stepEst', 0);
stepData{30}.inf = struct('user',SUB, 'pl', BPOC, 'stepEst', 0);

stepData{31}.inf = struct('user',SUB, 'pl', UPOC, 'stepEst', 0);
stepData{32}.inf = struct('user',SUB, 'pl', UPOC, 'stepEst', 0);
stepData{33}.inf = struct('user',SUB, 'pl', UPOC, 'stepEst', 0);
stepData{34}.inf = struct('user',SUB, 'pl', UPOC, 'stepEst', 0);
stepData{35}.inf = struct('user',SUB, 'pl', UPOC, 'stepEst', 0);

stepData{36}.inf = struct('user',SUB, 'pl', HAND, 'stepEst', 0);
stepData{37}.inf = struct('user',SUB, 'pl', HAND, 'stepEst', 0);
stepData{38}.inf = struct('user',SUB, 'pl', HAND, 'stepEst', 0);
stepData{39}.inf = struct('user',SUB, 'pl', HAND, 'stepEst', 0);
stepData{40}.inf = struct('user',SUB, 'pl', HAND, 'stepEst', 0);
stepData{41}.inf = struct('user',SUB, 'pl', HAND, 'stepEst', 0);

stepData{42}.inf = struct('user',SUB, 'pl', WATCH, 'stepEst', 0);
stepData{43}.inf = struct('user',SUB, 'pl', WATCH, 'stepEst', 0);
stepData{44}.inf = struct('user',SUB, 'pl', WATCH, 'stepEst', 0);

if 1
    data = InitData('./6People/data76.txt');
    stepBreakPoint = [16341,16552,16765,16965,17189,17401,17614,17824,18056,18252,18459,18678,18894,19115,19330,19548,19755,19975,20183,20403,20617,20846,21065,21270,21489,21702,21925,22156,22362,22584,22796,23006,23216,23425,23639,23847,24055,24265,24461,24636,35798,36040,36231,36457,36667,36879,37095,37300,37532,37739,37953,38167,38382,38601,38821,39035,39249,39471,39693,39918,40133,40354,40573,40799,41024,41229,41448,41664,41877,42087,42310,42511,42724,42946,43159,43378,43596,43809,44025,44247,44457,44679,44878,45092,45306,45523];
    stepBreakPoint = sort(stepBreakPoint);
    stepBreakPoint1 = stepBreakPoint(1:40);
    stepBreakPoint2 = stepBreakPoint(41:end);
    
    item.axis = data.fIMU;
    item.sbp = stepBreakPoint1;
    item.inf  = struct('user',SUB, 'pl', UPOC, 'stepEst', 0);
    stepData(45) = {item};
    
    item.axis = data.fIMU;
    item.sbp = stepBreakPoint2;
    item.inf  = struct('user',SUB, 'pl', UPOC, 'stepEst', 0);
    stepData(46) = {item};
    
    
    data = InitData('./6People/data(79).txt');
    stepBreakPoint = [14978,15174,15429,15678,15888,16124,16354,16600,16825,17068,17274,17505,17747,17968,18190,18428,18647,18891,19130,19352,19572,19801,20025,20253,20461,20696,20908,21130,21346,21559,21778,22004,22212,22438,22651,22873,23092,23306,23525,23769,36262,36463,36755,36957,37194,37426,37650,37881,38112,38343,38575,38800,39043,39273,39496,39734,39974,40186,40423,40646,40875,41097,41315,41544,41778,42012,42232,42454,42672,42887,43097,43323,43537,43752,43962,44177,44400,44636,44850,45074,45293,45508,45731,45955,46166];
    stepBreakPoint = sort(stepBreakPoint);
    stepBreakPoint1 = stepBreakPoint(1:40);
    stepBreakPoint2 = stepBreakPoint(41:end);
    
    item.axis = data.fIMU;
    item.sbp = stepBreakPoint1;
    item.inf  = struct('user',SUB, 'pl', UPOC, 'stepEst', 0);
    stepData(47) = {item};
    
    item.axis = data.fIMU;
    item.sbp = stepBreakPoint2;
    item.inf  = struct('user',SUB, 'pl', UPOC, 'stepEst', 0);
    stepData(48) = {item};
    
    data = InitData('./6People/data81.txt');
    stepBreakPoint = [16305,16504,16701,16912,17106,17306,17519,17727,17931,18144,18339,18550,18764,18979,19182,19399,19595,19804,20012,20224,20424,20628,20843,21044,21254,21461,21676,21868,22075,22271,22469,22676,22884,23076,23278,23477,23676,23874,24081,24279,24512,37928,38142,38349,38545,38741,38942,39135,39344,39540,39751,39957,40152,40351,40558,40752,40959,41172,41373,41573,41778,41972,42177,42389,42599,42806,43016,43218,43425,43619,43827,44037,44251,44462];
    stepBreakPoint = sort(stepBreakPoint);
    stepBreakPoint1 = stepBreakPoint(1:41);
    stepBreakPoint2 = stepBreakPoint(42:end);
    
    item.axis = data.fIMU;
    item.sbp = stepBreakPoint1;
    item.inf  = struct('user',SUB, 'pl', UPOC, 'stepEst', 0);
    stepData(49) = {item};
    
    item.axis = data.fIMU;
    item.sbp = stepBreakPoint2;
    item.inf  = struct('user',SUB, 'pl', UPOC, 'stepEst', 0);
    stepData(50) = {item};
    
    
    data = InitData('./6People/data(80).txt');
    stepBreakPoint = [23865,24128,24374,24580,24868,25162,25361,25559,25778,25977,26173,26367,26558,26760,26937,27235,27411,27582,27787,27993,28192,28384,28578,28782,28982,29190,29379,29595,29778,29982,30181,30384,30591,30794,30995,31187,31368,31581,31756,31961,32157,32355,32549,32736,32926,33109,33299,33497,33677,33881,34067,34254,34455,34649,49237,49456,49657,49858,50057,50253,50449,50650,50856,51056,51249,51442,51643,51843,52038,52238,52437,52634,52840,53040,53239,53439,53644,53848,54045,54237,54434,54630,54824,55018,55227,55425,55618,55815,56022,56201,56388,56581,56780,56979,57187,57384,57571,57934];
    stepBreakPoint = sort(stepBreakPoint);
    stepBreakPoint1 = stepBreakPoint(1:54);
    stepBreakPoint2 = stepBreakPoint(55:end);
    
    item.axis = data.fIMU;
    item.sbp = stepBreakPoint1;
    item.inf  = struct('user',SUB, 'pl', BPOC, 'stepEst', 0);
    stepData(51) = {item};
    
    item.axis = data.fIMU;
    item.sbp = stepBreakPoint2;
    item.inf  = struct('user',SUB, 'pl', BPOC, 'stepEst', 0);
    stepData(52) = {item};
    
    
    data = InitData('./6People/data(81).txt');
    stepBreakPoint = [17882,18151,18346,18538,18732,18929,19124,19323,19526,19727,19928,20126,20331,20536,20736,20936,21137,21333,21534,21736,21938,22137,22336,22538,22739,22940,23142,23338,23533,23725,23927,24121,24316,24507,24700,24888,25082,25279,25472,25669,25868,38842,39059,39260,39457,39650,39840,40028,40224,40418,40616,40817,41011,41211,41410,41604,41800,41999,42196,42393,42585,42778,42976,43178,43381,43584,43784,43979,44176,44373,44574,44775,44980,45184,45406];
    stepBreakPoint = sort(stepBreakPoint);
    stepBreakPoint1 = stepBreakPoint(1:41);
    stepBreakPoint2 = stepBreakPoint(42:end);
    
    item.axis = data.fIMU;
    item.sbp = stepBreakPoint1;
    item.inf  = struct('user',SUB, 'pl', POC, 'stepEst', 0);
    stepData(53) = {item};
    
    item.axis = data.fIMU;
    item.sbp = stepBreakPoint2;
    item.inf  = struct('user',SUB, 'pl', POC, 'stepEst', 0);
    stepData(54) = {item};
end