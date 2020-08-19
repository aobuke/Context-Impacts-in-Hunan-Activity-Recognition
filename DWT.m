classdef DWT < handle
% This class is the DWT,
% 5_STFT_Wavelet.pdf EMBS
% Vertical acceleration
    
properties
    thr = [];
    data = [];
    dataLen = [];
    lev = [];
    wname = 'db10'%'sym2';
    timeFreqSpec = [];
    ratioMatrix = [];
    alpha = 3;
    beta = 4;
    colNum = 0;
end %properties

methods
    function self = DWT(input, threshold, level)
        self.colNum = size(input, 1);
        self.thr = threshold;
        self.data = input;
        self.dataLen = length(input);
        self.lev = level;
        self.timeFreqSpec = zeros([level,size(input,2)]);
        self.ratioMatrix = zeros([size(input,2), self.colNum]);
    end
    function self = run(self, avgFilterCoef)
        if (self.colNum == 1) % input is Vector
            [c,l] = wavedec(self.data,self.lev,self.wname);
            for k = 1:self.lev
                d = detcoef(c, l, k);
                rd = upcoef('d', d, self.wname, k, self.dataLen);
                self.timeFreqSpec(k,:) = rd;
            end
            
            for i = 1:self.dataLen
                self.ratioMatrix(i) = sum(abs(self.timeFreqSpec(7:8,i))) ;%/ sum(abs(self.timeFreqSpec(:,i))); 
            end
            % mean filter
            self.ratioMatrix = medfilt1(self.ratioMatrix, avgFilterCoef);
        else % input has multiple frames
            for col = 1:self.colNum
                oneFrame = self.data(:,col);
                [c,l] = wavedec(oneFrame,self.lev,self.wname);
                for k = 1:self.lev
                    d = detcoef(c, l, k);
                    rd = upcoef('d', d, self.wname, k, self.dataLen);
                    self.timeFreqSpec(k,:) = rd;
                end
                
                for i = 1:self.dataLen
                    self.ratioMatrix(i,col) = sum(abs(self.timeFreqSpec(5,i))) / sum(abs(self.timeFreqSpec(:,i))); %7:8
                end
            end
            % mean filter
            self.ratioMatrix = medfilt1(self.ratioMatrix, avgFilterCoef);
        end

    end

    function result = isWalking(self, threshold)
        % thresholding the ratio at end/3, end/2, end*2/3
        len = size(self.ratioMatrix, 1);
        pos1 = floor(len/3);
        pos2 = floor(len/2);
        pos3 = floor(len*2/3);
        
        result = self.ratioMatrix([pos1, pos2, pos3],:) > threshold;
        result = sum(result) == 3;
    end
    function showTimeFreq(self)
        len = self.dataLen;
        cfd = zeros(self.lev,len);
        nbcol = 64;
        [c,l] = wavedec(self.data,self.lev,self.wname);
        for k = 1:self.lev
            d = detcoef(c,l,k);
            d = d(:)';
            d = d(ones(1,2^k),:);
            cfd(k,:) = wkeep1(d(:)',len);
        end
        cfd =  cfd(:);
        I = find(abs(cfd)<sqrt(eps));
        cfd(I) = zeros(size(I));
        cfd = reshape(cfd,self.lev,len);
        cfd = wcodemat(cfd,nbcol,'row');


        colormap(pink(nbcol));
        figure,image(cfd);
        tics = 1:self.lev;
        labs = int2str((1:self.lev)');
        ax = gca;
        ax.YTickLabelMode = 'manual';
        ax.YDir = 'normal';
        ax.Box = 'On';
        ax.YTick = tics;
        ax.YTickLabel = labs;
        title('Discrete Wavelet Transform, Absolute Coefficients.');
        xlabel('Time (or Space)');
        ylabel('Level');
        
    end
    
end


end