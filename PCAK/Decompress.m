function I_rec = Decompress(I_comp)
    data = I_comp.km.means(I_comp.km.data, :);
    d = I_comp.pca.patch;
    Xzm = I_comp.pca.eigen * data';
    X = Xzm' + repmat(I_comp.pca.mean, size(Xzm, 2), 1);
    
    I_rec = ones(d*I_comp.pca.blocks(1), d*I_comp.pca.blocks(2));
    c = I_comp.colours;
    for k=1:c
    	for j=1:d
		    for i=1:d
		    	I_rec(i:d:end, j:d:end, k) = reshape(X(:, i + d*(j-1) + d*d*(k-1)), I_comp.pca.blocks(1), I_comp.pca.blocks(2), 1);
    		end
    	end
    end
    
    sz = size(I_rec);
    
    % smooth patch edges
    cbounds = cat(4, I_rec(d-1:d:end-2, :, :), I_rec(d:d:end-1, :, :), I_rec(d+1:d:end-1, :, :), I_rec(d+2:d:end-1, :, :));
    cbmu = mean(cbounds, 4);
    I_rec(d:d:end-1, :, :) = cbmu;
    I_rec(d+1:d:end-1, :, :) = cbmu;
    cbounds = cat(4, I_rec(:, d-1:d:end-2, :), I_rec(:, d:d:end-1, :), I_rec(:, d+1:d:end, :), I_rec(:, d+2:d:end, :));
    cbmu = mean(cbounds, 4);
    I_rec(:, d+1:d:end-1, :) = cbmu;
    I_rec(:, d:d:end-1, :) = cbmu;
    
    % pad to original size
    padding = I_comp.size - sz(1:2);
    I_rec = padarray(I_rec, padding, 'replicate', 'post');
