% common parameters
balanceData = 0;
% XYZ and MAG
XAXIS = 1;
YAXIS = 2;
ZAXIS = 3;
MAXIS = 4;
% Sensor
ACC = 1;
GYR = 2;
% placement enum
FOO = 1;
POC = 2; % front pocket
BPOC = 3;
UPOC = 4;
HAND = 5;
WATCH = 6;

% Activity enum
WK = 1;
RID = 2;
UPS = 3;
DWS = 4;
% people ID
ABK = 111;
ZT = 222;
PAN = 333;
SUB = 999;
%% Training Data Generating


MAG = @(x) sqrt(sum(x.^2,2));

DOWNSAMPLERATE = [1 2 4 10 20 40]; % 200 100 50 20 10 5 Hz
WINDOWSIZELIST = 300:100:1200;