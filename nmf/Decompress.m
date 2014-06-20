function I_rec = Decompress(I_comp)
    d=I_comp.d;

    if isequal(size(I_comp.size,2),3)

        Ur=full(I_comp.U(:,:,1));
        Ug=full(I_comp.U(:,:,2));
        Ub=full(I_comp.U(:,:,3));
        
        Zr=full(I_comp.Z(:,:,1));
        Zg=full(I_comp.Z(:,:,2));
        Zb=full(I_comp.Z(:,:,3));
        
        Xr=Ur*Zr;
        Xg=Ug*Zg;
        Xb=Ub*Zb;
        

        I_rec=cat(3,Xr,Xg,Xb);
    elseif isequal(size(I_comp.size,2),2)
        I_rec=full(I_comp.U)*full(I_comp.Z);
        
    end

end

