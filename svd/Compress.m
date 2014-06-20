function I_comp = Compress(I)


k=10;%dimensions to retain
s=size(I);

if size(I,3)==3 
    I = [I(:,:,1),I(:,:,2),I(:,:,3)];
end
[U,D,V]=svd(I);

I_comp = struct('U',U(:,1:k),'D',D(1:k,1:k),'V',V(:,1:k),'k',k,'s',s); 
end

