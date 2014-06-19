function I_comp = Compress(I, k)
    d = 5; % patch size
    if (nargin < 2) k = 4; end % dimensions to retain
    cmin = 4; % minimum number of k-means clusters
    cmax = 32; % maximum number of k-means clusters
    mse_target = 0.2; % target mean squared error in PCA reconstruction
    
	[X, blocks] = extract(I, d);
	[mu, lambda, U] = PCAanalyse(X);
	k = sum(lambda > 0.05);
    Xzm = X - repmat(mu, size(X, 1), 1);
    Zzm = U' * Xzm';
	PCAdata = struct('mean', single(mu), 'eigen', single(U(:, 1:k)), 'blocks', blocks, 'patch', d);
    
    mse = 1; oldmse = 2; c = cmin/2;
    while (mse > mse_target)
    	c = c * 2;
    	mse = oldmse;
		[mus, Z, mse] = Kmeans(Zzm(1:k,:)', c);
		if c >= cmax break; end % max. clusters
	end
	
	sz = size(I);
	colours = size(I, 3);
	Kmdata = struct('means', single(mus), 'data', pixpack(uint8(Z)-1, c));
	I_comp = struct('pca', PCAdata, 'km', Kmdata, 'size', sz(1:2), 'colours', colours);
