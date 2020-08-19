% Frame Generating
function [X, Y, Z, num] = Buffer3D(data, wSize, olSize)

	X = buffer(data(:,1), wSize, olSize, 'nodelay')';
	Y = buffer(data(:,2), wSize, olSize, 'nodelay')';
	Z = buffer(data(:,3), wSize, olSize, 'nodelay')';

	num = size(X, 2);

end