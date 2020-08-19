function [stepNum, tpN, fpN] = StepCalcPTM(input, threshold, mode, method, para )
MAG = @(x) sqrt(sum(x.^2,2));

onFIG = 0;
onPTM = 0;
onFSM = 0;
onSTFT = 0;
onDWT = 0;
onDWT2 = 0;
if method == 'p'
    onPTM = 1;
elseif method == 'f'
    onFSM = 1;
elseif method == 's'
    onSTFT = 1;
elseif method == 'd'
    onDWT = 1;
elseif method == 'D'
    onDWT = 1;
    onDWT2 = 1;
end
clear ptm;
clear stft;
clear fsm;
mag = MAG(input.axis);
stepIndex = input.sbp;
stepNum = length(stepIndex) - 1;
startPos = stepIndex(1);
endPos = stepIndex(end);
% vertical axis selection
if 0
    m1 = mean(input.axis(:,1));
    m2 = mean(input.axis(:,2));
    m3 = mean(input.axis(:,3));
    v1 = var(input.axis(:,1));
    v2 = var(input.axis(:,2));
    v3 = var(input.axis(:,3));
    sel = abs(abs([m1, m2, m3]) - 10);
    
    [a,b] = min(sel); % b is gravity axis
    [a,bv] = max([v1, v2, v3]);
    [a,bw] = min([v1, v2, v3]);
    xxx = [1 2 3]; xxx = xxx(xxx~=b); xxx = xxx(xxx~=bw);
    if length(xxx)>1
        forward = bv;
    else
        forward = xxx;
    end
    if 1
        mag = input.axis(:,b);
        if (mean(mag)<0)
            mag = -mag;
        end
    else
        mag = input.axis(:,forward);
    end
    
end
% normalize the magnitude
if 0
    mag2 = mag(startPos:endPos);
    m = mean(mag2);
    maximum = max(mag2-m);
    minimum = min(mag2-m);
    mag = (mag - m) * 24/(maximum-minimum);
    %mag = (mag - m) * 12/max(mag2-m);
    mag = mag + m;
elseif 1
    mag2 = mag(startPos:endPos);
    m = mean(mag2);
    mag = (mag-m) * 3.3/std(mag2);
    mag = mag+m;
    global probe; probe(end+1,:) = [mean(mag) max(mag) min(mag) var(mag)];
end
%plot(mag(startPos:endPos))
mag = mag(startPos:endPos);
if onPTM == 1
    ptm = PTM(mag);
    ptm = ptm.Run(para);
    if onFIG == 1
        ptm.View()
    end
    y = ptm.mY3;
elseif onSTFT == 1
    stft = STFT(mag, 0.23); % 0.23
    [spec, time] = stft.run();
    if 0
        y = time;
    else
        y=stft.accMagnitudeReconstructD;
    end
    % max-min normalized is worse than max normalize
    % var normalize seems to be best
    y2 = y;%(startPos:endPos);
    m = mean(y2);
    y = (y-m) * 3.3/std(y2);
    y = y+m;
    
elseif onFSM
    N = 50; % 50 is better upon all place; 100(POC) 50(FOO)
    b = fir1(N, 0.03);
    mag = filter(b, 1, mag);
    s = floor(N/2) + 1;
    mag = [mag(s:end); zeros(s-1,1)]; % remove filter delay
    if 0 % normalization by std
        mag2 = mag(startPos:endPos);
        m = mean(mag2);
        mag = (mag-m) * 3.3/std(mag2);
        mag = mag+m;
    end
    %thr = [11, 14, 7, 8.4]; %  4-9.5
    thr = [10.5, 12, 8.5, 9]; % adapt to normalized signal
    thr(2) = threshold;
    fsm = FSM(mag, thr);
    [count, sSeq, timeStamp] = fsm.run();
elseif onDWT == 1
    [c,l] = wavedec(mag, 8, 'db10');
    rd = 0;
    if onDWT2 == 0
        for k = 6:8
            d = detcoef(c, l, k);
            rd =rd +  upcoef('d', d, 'db10', k, length(mag));
        end
    else
        for k = 2:3
            d = detcoef(c, l, k);
            d = upcoef('d', d, 'db10', k, length(mag));
            d = abs(d);
            rd = rd+d;
        end
        % Integration
        N = 100;
        rd  = filter(ones(N,1), 1, rd);
        s = floor(N/2) + 1;
        rd = [rd(s:end); zeros(s-1,1)]; % remove filter delay
    end
    
    y = rd;
end

minpeakdis = para.mpd;

for j = 1%:length(threshold)
    thr = threshold(j);
    if onFSM == 1
        %detect = timeStamp;
        temp = zeros(size(mag));
        temp(timeStamp) = 1;
        [pks, detect] = findpeaks(temp, 'minpeakdistance', minpeakdis);
    elseif (onPTM == 1)||(onSTFT == 1)||(onDWT == 1)
        [pks,locs] = findpeaks(y,'minpeakdistance',minpeakdis,'MinPeakHeight',thr, 'MinPeakProminence',0.5);
        %         plot(x(:,1),'Color','blue'); hold on;
        %         plot(locs,x(locs,1),'k^','markerfacecolor',[1 0 0]);
        detect = locs;
    else
        detect =  find(diff(sign(y - thr))==2);
    end
    %sum(abs(diff(sign(xxx-0.09))))/2
    if onFIG == 1
        figure, plot(y)
        hold on,plot(detect, y(detect),'ro');
    end
    if mode == 1
        stepNumEst(j) = sum(detect);
    elseif mode == 3
        %stepIndex2 = interp1(1:length(stepIndex),stepIndex,1:0.5:length(stepIndex));
        stepNum = 2*stepNum;
        detect = detect((detect>startPos) & (detect<endPos) );
        temp = sum(diff(detect) < 80) / 2;
        temp = floor(temp);
        tpN = length(detect) - temp;
        fpN = temp/stepNum;
        if tpN > stepNum
            tpN = stepNum;
            fpN = length(detect) - stepNum;
        end
    else
        stepIndex = stepIndex - stepIndex(1) + 1;
        for i = 1:length(stepIndex)-1
            if stepIndex(i+1) - stepIndex(i) <400
                detectO(i) = sum( (detect < stepIndex(i+1))&(detect > stepIndex(i)) );
            end
        end
        tpN = sum(detectO~=0);
        tp = tpN/stepNum;
        fpN = sum(detectO) - tpN;
        fp = (sum(detectO)-tpN)/stepNum;%sum(detectO);
        roc(j,1:2) = [tp, fp];
        %j = j+1;
    end
end

end