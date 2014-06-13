function I_comp = Compress(I)
    d = 20; % patch size
    k = 1; % dimensions to retain
%     c = 16; % number of k-means clusters
    
	[U, Z] = nnmf(I, k);
% 	[mu, lambda, U] = PCAanalyse(X);
	
%     Xzm = X - repmat(mu, size(X, 1), 1);
%     Zzm = U' * Xzm';
%     [mus, Z, msd] = Kmeans(Zzm(1:k,:)', c);
%     
%     sz = size(I);
%     colours = size(I, 3);
%     PCAdata = struct('mean', mu, 'eigen', U(:, 1:k), 'blocks', blocks, 'patch', d);
%     Kmdata = struct('means', mus, 'data', uint8(Z));
    I_comp = struct('U', U, 'Z', Z, 'd', d, 'k', k);
