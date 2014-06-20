function I_comp = Compress(I)

    k = 4; % dimensions to retain
    cols = size(I,3);

    if cols == 3

        IR=I(:,:,1);
        IG=I(:,:,2);
        IB=I(:,:,3);
        [Ur, Zr] = nnmf(IR, k);
        [Ug, Zg] = nnmf(IG, k);
        [Ub, Zb] = nnmf(IB, k);
        U=cat(3,Ur,Ug,Ub);
        Z=cat(3,Zr,Zg,Zb);
    else
        [U, Z] = nnmf(I, k);
    end

    I_comp = struct('U', U, 'Z', Z, 'k', k,'cols',cols);
