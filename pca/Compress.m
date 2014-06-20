function I_comp = Compress(I, k)
    d = 5; % patch size
    k = 4; % dimensions to retain   
    
	[X, blocks] = extract(I, d);
    
	[mu, lambda, U] = PCAanalyse(X);
	
    Xzm = X - repmat(mu, size(X, 1), 1);
    Zzm = U' * Xzm';               
    
    I_comp = struct();
    I_comp.size = size(I);
    I_comp.colours = size(I,3);            
    I_comp.mean = single(mu);    
    I_comp.eigen = single(U(:,1:k));
    I_comp.data = single(Zzm(1:k,:));
    I_comp.blocks = blocks;
    I_comp.patch = d;  
    