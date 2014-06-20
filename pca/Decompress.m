function I_rec = Decompress(I_comp, smooth)
	
    data = I_comp.data;        
    
    d = I_comp.patch;
   
    Xzm = I_comp.eigen * data;        
    X = Xzm' + repmat(I_comp.mean, size(Xzm, 2), 1);    
    
    I_rec = depatch(X, d, I_comp.blocks, I_comp.colours);
    sz = I_comp.size;
    % crop to original size
	I_rec = I_rec(1:sz(1),1:sz(2),:);
