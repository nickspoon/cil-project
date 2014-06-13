function Z = pixpack(X, c)
	% PRECONDITION: X is an n-by-1 matrix, c is a power of 2
	bsize = lcm(8, log2(c)); % encoding block size (bits)
	cols = bsize/log2(c);
	pad = cols - rem(size(X, 1), cols);
	Xpad = [X; zeros(pad, 1)];
	Xd = reshape(Xpad, [], cols);
	factors = (c * ones(1, cols)) .^ (0:cols-1);
	Y = double(Xd) .* repmat(factors, size(Xd, 1), 1);
	Y = uint64(sum(Y,2));
	bytes = bsize/8;
	for i = 1:bytes
		Zd(:,i) = bitand(bitshift(Y, -8*(i-1)), 255);
	end
	Z = struct('data', uint8(Zd), 'size', size(X, 1));
	assert(all(X == unpixpack(Z,c)));
