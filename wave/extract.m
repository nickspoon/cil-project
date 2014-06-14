function [X, blocks] = extract(I, d)
    % crop image to a multiple of d
    block_rows = floor(size(I, 1)/d);
    block_cols = floor(size(I, 2)/d);
    blocks = [block_rows, block_cols];
    Ic = I(1:block_rows*d, 1:block_cols*d, :);
    
    c = size(I, 3);
    for k=1:c
    	for j=1:d
		    for i=1:d
    			X(:, i + d*(j-1) + d*d*(k-1)) = reshape(Ic(i:d:end, j:d:end, k), [], 1);
    		end
    	end
    end