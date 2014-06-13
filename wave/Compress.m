function I_comp = Compress(I)
    d = 8; % patch size
 	X = extract(I, d);
    X=X';
    for i=1:size(X,2)
        perro=vec2mat(X(:,i)',d);
%         'perro';
        size(X);
        [HAH,H]=Harr(perro);
        size(H);
        size(HAH);
        HAH=H'\HAH/H;
        X(:,i)=reshape(HAH,1,d*d);
    end
    X=X';
% 	 [mu, lambda, U] = PCAanalyse(X);
	
%     Xzm = X - repmat(mu, size(X, 1), 1);
%     Zzm = U' * Xzm';
%     [mus, Z, msd] = Kmeans(Zzm(1:k,:)', c);
%     
%     sz = size(I);
%     colours = size(I, 3);
%     PCAdata = struct('mean', mu, 'eigen', U(:, 1:k), 'blocks', blocks, 'patch', d);
%     Kmdata = struct('means', mus, 'data', uint8(Z));
%     I_comp = struct('', PCAdata, 'km', Kmdata, 'size', sz(1:2), 'colours', colours);
    
    I_comp = struct('d', d, 'X', X,'size',size(I));
end
