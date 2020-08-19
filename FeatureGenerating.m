% FeatureGenerating
function featureMatrix = FeatureGenerating(dataMatrix, featureIdx)
	% format of dataMatrix, size(index * frame No. )
	% column number is frame number.
	% one column is one frame

	% format of featureMatrix, size(frame No.* feature No.)
	% one row is one frame

	% column 1 - 5 : mean, variance, peak, min, skewness, kurtosis
	% column 6: energy, entropy, FFT, FFTpeak, spectrum bins
	% column : wavelet coeff
	% column : MFCC
	featureNum = 7;
	featureMatrix = zeros(size(dataMatrix,1), featureNum);
	featureMatrix(:,1) = mean(dataMatrix,2)';
	featureMatrix(:,2) =  var(dataMatrix, 1, 2)';
	featureMatrix(:,3) = max(dataMatrix, [], 2)';
	featureMatrix(:,4) = min(dataMatrix, [], 2)';
	featureMatrix(:,5) = skewness(dataMatrix, 1, 2)'; %para: X flag, dim
	featureMatrix(:,6) = kurtosis(dataMatrix, 1, 2)'; % X, flag, dim

	featureMatrix(:,7) =  sum(dataMatrix.^2, 2)/size(dataMatrix, 2); % 49AAAI.pdf
	%featureMatrix(:,8) = featureMatrix(:,3) - featureMatrix(:,4);
    featureMatrix(:,8) = ZCR(dataMatrix', 20)';
    spec = abs(fft(dataMatrix'))';
    featureMatrix(:,9:17) = spec(:,2:10);
    
	featureMatrix = featureMatrix(:,featureIdx);

    fprintf('\n feature extraction finished \n');

end