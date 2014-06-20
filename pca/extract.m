function [X, blocks] = extract(I, d)
    % crop image to a multiple of d
    block_rows = ceil(size(I, 1)/d);
    block_cols = ceil(size(I, 2)/d);
    blocks = [block_rows, block_cols];
    c = size(I, 3);
    
	if c == 1
		padding = [block_rows*d block_cols*d] - size(I);
	else
		padding = [block_rows*d block_cols*d 3] - size(I);
	end
		
	Ic = padarray(I, padding, 'replicate', 'post');
    
    for k=1:c
    	for j=1:d
		    for i=1:d
    			X(:, i + d*(j-1) + d*d*(k-1)) = reshape(Ic(i:d:end, j:d:end, k), [], 1);
    		end
    	end
    end
