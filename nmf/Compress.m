function I_comp = Compress(I)
<<<<<<< HEAD
    d = 8; % patch size
    k = 6; % dimensions to retain
    datl=size(I);
%     I2=I;
    if isequal(size(datl,2),3)
%         [IR,IG,IB,sz]=color(I2,d);
        IR=I(:,:,1);
        IG=I(:,:,2);
        IB=I(:,:,3);
        [Ur, Zr] = nnmf(IR, k);
        [Ug, Zg] = nnmf(IG, k);
        [Ub, Zb] = nnmf(IB, k);
        U=cat(3,Ur,Ug,Ub);
        Z=cat(3,Zr,Zg,Zb);
    elseif isequal(size(datl,2),2)
%         [I2,sz]=nocolor(I2,d);
        [U, Z] = nnmf(I, k);
    end
=======
    d = 20; % patch size
    k = 1; % dimensions to retain
%     c = 16; % number of k-means clusters
>>>>>>> parent of 0ffba22... Merge branch 'master' of github.com:nickspoon/cil-project
    
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
