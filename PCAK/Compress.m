function I_comp = Compress(I)
    d = 4; % patch size
    k = 3; % dimensions to retain
    [X, blocks] = extract(I, d);
    [mu, lambda, U] = PCAanalyse(X);
    Xzm = X - repmat(mu, size(X, 1), 1);
    Zzm = U' * Xzm';
    [mus, Z] = Kmeans(Zzm(1:k,:)');
    sz = size(I);
    colours = size(I, 3);
    PCAdata = struct('mean', mu, 'eigen', U(:, 1:k), 'blocks', blocks);
    Kmdata = struct('means', mus, 'data', uint8(Z));
    I_comp = struct('pca', PCAdata, 'km', Kmdata, 'size', sz(1:2), 'colours', colours);