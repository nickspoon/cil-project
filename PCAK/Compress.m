function I_comp = Compress(I, k, d, c)
    if (nargin < 2)
    	k = 4; % dimensions to retain
    end
    if (nargin < 3)
    	d = 3; % patch size
    end
    if (nargin < 4)
    	cmin = 4; % minimum number of k-means clusters
	    cmax = 32; % maximum number of k-means clusters
    else
    	cmin = c; cmax = c; % fix cluster number
	end
    mse_target = 0.002; % target mean squared error in k-means reconstruction
    
	[X, blocks] = extract(I, d);
	[mu, lambda, U] = PCAanalyse(X);
	
    Xzm = X - repmat(mu, size(X, 1), 1);
    Zzm = U' * Xzm';
	PCAdata = struct('mean', single(mu), 'eigen', single(U(:, 1:k)), 'blocks', blocks, 'patch', d);
    
    mse = 1; c = cmin/4;
    while (mse > mse_target)
    	c = c * 4;
		[mus, Z, mse] = Kmeans(Zzm(1:k,:)', c);
		if c >= cmax break; end % max. clusters
		
		R = U(:, 1:k) * mus(Z, :)';
		dist = (Xzm' - R).^2;
		mse = mean(dist(:));
	end
	
	sz = size(I);
	colours = size(I, 3);
	Kmdata = struct('means', single(mus), 'data', pixpack(uint8(Z)-1, c));
	I_comp = struct('pca', PCAdata, 'km', Kmdata, 'size', sz(1:2), 'colours', colours);
	
