function I_rec = Decompress(I_comp)
    d=I_comp.d;

    if isequal(size(I_comp.size,2),3)

        Ur=I_comp.U(:,:,1);
        Ug=I_comp.U(:,:,2);
        Ub=I_comp.U(:,:,3);
        
        Zr=I_comp.Z(:,:,1);
        Zg=I_comp.Z(:,:,2);
        Zb=I_comp.Z(:,:,3);
        
        Xr=Ur*Zr;
        Xg=Ug*Zg;
        Xb=Ub*Zb;
        
        t1=I_comp.size(1)/d;
        t2=I_comp.size(2)/d;

        Xr=otro2(Xr,t1,t2,d);
        Xg=otro2(Xg,t1,t2,d);
        Xb=otro2(Xb,t1,t2,d);
        
        I_rec=cat(3,Xr,Xg,Xb);
    elseif isequal(size(I_comp.size,2),2)
        I_rec=I_comp.U*I_comp.Z
        
    end
    figure ,imshow(uint8(I_rec));
end
function KK=otro2(X,m,n,d)
    col=1;
    KK=[];
    for i=1:m
        K=[];
        for j=1:n
            K=cat(2,K,reshape(X(:,col),d,d)');
            col=col+1;
        end
        KK=cat(1,KK,K);
    end
%     col
%     KK 
    
end
