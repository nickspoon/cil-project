function I_comp = Compress(I)
    d = 5; % patch size
    k = 6; % dimensions to retain
    c = 16; % number of k-means clusters
    
	[X, blocks] = extract(I, d);
	[mu, lambda, U] = PCAanalyse(X);
	
    Xzm = X - repmat(mu, size(X, 1), 1);
    Zzm = U' * Xzm';
    [mus, Z, msd] = Kmeans(Zzm(1:k,:)', c);
    
    sz = size(I);
    colours = size(I, 3);
    PCAdata = struct('mean', mu, 'eigen', U(:, 1:k), 'blocks', blocks, 'patch', d);
    Kmdata = struct('means', mus, 'data', uint8(Z));
    I_comp = struct('pca', PCAdata, 'km', Kmdata, 'size', sz(1:2), 'colours', colours);
