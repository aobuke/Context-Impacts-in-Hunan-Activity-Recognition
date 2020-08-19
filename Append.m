%  Append y to x
%
function x = Append(x, y, mark)
	rowX = size(x,1);
	rowY = size(y,1);
	col = size(y,2) + length(mark);
	colY = size(y,2);
	if isempty(x)
		x = zeros([rowY, col]);
		x(1:rowY, 1:colY) = y;
		x(:, colY+1: col) = repmat(mark, rowY, 1);
	else
		x = padarray(x, rowY, 'post');
		x(rowX+1:end, 1:colY) = y;
		x(rowX+1:end, colY+1:end) = repmat(mark, rowY, 1);
end