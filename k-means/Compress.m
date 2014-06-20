function I_comp = Compress(I)    

d = 3; % patch size
c = 32; % n of clusters
    
[X,blocks] = extract(I,d);        

[idx,ctrs] = kmeans(X,c, 'start','cluster','emptyaction', 'singleton', 'options',struct('MaxIter',10));

sz = size(I);

I_comp = struct();
I_comp.idx = uint8(idx);
I_comp.ctrs = im2uint8(ctrs);
I_comp.d = uint8(d);
I_comp.colours = uint8(size(I,3));
I_comp.size = uint16(sz(1:2));
I_comp.blocks = blocks;