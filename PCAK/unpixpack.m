function X = unpixpack(in, c)
	if c == 128; c = 256; end % ugly solution to overflow problem

	Z = in.data;
	bsize = lcm(8, log2(c));
	bytes = bsize/8;
	factors = (256 * ones(1, bytes)) .^ (0:bytes-1);
	Y = double(Z) .* repmat(factors, size(Z,1), 1);
	Y = sum(Y, 2);
	
	cols = bsize/log2(c);
	for i = 1:cols
		Xd(:,:,i) = bitand(bitshift(Y, -log2(c)*(i-1)), c-1);
	end
	X = reshape(Xd, [], 1);
	X = X(1:in.size);
