function I_comp = Compress(I)
    d = 8; % patch size
    k = 1; % dimensions to retain
    datl=size(I);
    I2=I;
    if isequal(size(datl,2),3)
        [IR,IG,IB,sz]=color(I2,d);
        [Ur, Zr] = NoNMF(IR, k);
        [Ug, Zg] = NoNMF(IG, k);
        [Ub, Zb] = NoNMF(IB, k);
        U=cat(3,Ur,Ug,Ub);
        Z=cat(3,Zr,Zg,Zb);
    elseif isequal(size(datl,2),2)
        [I2,sz]=nocolor(I2,d);
        [U, Z] = NoNMF(I2, k);
    end
    
% 	[U, Z] = nnmf(I, k);

    I_comp = struct('U', U, 'Z', Z, 'd', d, 'k', k,'size',datl);
