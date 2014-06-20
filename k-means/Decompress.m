function I_rec = Decompress(I_comp)    
          
ctrs = im2double(I_comp.ctrs);
idx = I_comp.idx;
d = double(I_comp.d);        
blocks = I_comp.blocks;   
colours = I_comp.colours;

X = ctrs(idx,:);

I_rec = ones(d*blocks(1), d*blocks(2));
c = colours;
for k=1:c
    for j=1:d
        for i=1:d
            I_rec(i:d:end, j:d:end, k) = reshape(X(:, i + d*(j-1) + d*d*(k-1)), blocks(1), blocks(2), 1);
    	end
    end
end
       
sz = I_comp.size;
I_rec = I_rec(1:sz(1),1:sz(2),:);