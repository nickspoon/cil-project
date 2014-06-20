function I_rec = Decompress(I_comp, smooth)
	
    data = I_comp.data;        
    
    d = I_comp.patch;
   
    Xzm = I_comp.eigen * data;        
    X = Xzm' + repmat(I_comp.mean, size(Xzm, 2), 1);    
    
    I_rec = ones(d*I_comp.blocks(1), d*I_comp.blocks(2));
    c = I_comp.colours;
    for k=1:c
    	for j=1:d
		    for i=1:d
		    	I_rec(i:d:end, j:d:end, k) = reshape(X(:, i + d*(j-1) + d*d*(k-1)), I_comp.blocks(1), I_comp.blocks(2), 1);
    		end
    	end
    end
    
    sz = I_comp.size;
    % crop to original size
	I_rec = I_rec(1:sz(1),1:sz(2),:);
