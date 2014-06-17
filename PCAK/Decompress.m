function I_rec = Decompress(I_comp, smooth)
	if (nargin < 2) smooth = true; end % smooth by default
	butts = unpixpack(I_comp.km.data, size(I_comp.km.means, 1)) + 1;
    data = I_comp.km.means(butts, :);
    d = I_comp.pca.patch;
    Xzm = I_comp.pca.eigen * data';
    X = Xzm' + repmat(I_comp.pca.mean, size(Xzm, 2), 1);
    
    I_rec = depatch(X, d, I_comp.pca.blocks, I_comp.colours);
    
    if smooth
		% smooth patch edges
		cbounds = cat(4, I_rec(d-1:d:end-2, :, :), I_rec(d:d:end-1, :, :), I_rec(d+1:d:end-1, :, :), I_rec(d+2:d:end-1, :, :));
		cbmu = mean(cbounds, 4);
		I_rec(d:d:end-1, :, :) = cbmu;
		I_rec(d+1:d:end-1, :, :) = cbmu;
		cbounds = cat(4, I_rec(:, d-1:d:end-2, :), I_rec(:, d:d:end-1, :), I_rec(:, d+1:d:end, :), I_rec(:, d+2:d:end, :));
		cbmu = mean(cbounds, 4);
		I_rec(:, d+1:d:end-1, :) = cbmu;
		I_rec(:, d:d:end-1, :) = cbmu;
	end
    
    sz = I_comp.size;
    % crop to original size
	I_rec = I_rec(1:sz(1),1:sz(2),:);
