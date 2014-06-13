function I_rec = Decompress(I_comp)

d = double(I_comp.d);        
sz = double(I_comp.size);
X=I_comp.X;
blocks = floor(sz/d);   

   

br_vec = ones(1, size(X, 1));
bc_vec = size(X, 2);
C = mat2cell(X, br_vec, bc_vec);
Cr = cellfun(@(c) reshape(c, d, d), C, 'UniformOutput', false);
Cr = reshape(Cr, blocks(1), blocks(2));
I_rec = cell2mat(Cr);

imshow(I_rec);
end