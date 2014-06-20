function I = depatch(X, d, blocks, colours)
    I = ones(d*blocks(1), d*blocks(2));
    c = colours;
    for k=1:c
    	for j=1:d
		    for i=1:d
		    	I(i:d:end, j:d:end, k) = reshape(X(:, i + d*(j-1) + d*d*(k-1)), blocks(1), blocks(2), 1);
    		end
    	end
    end
