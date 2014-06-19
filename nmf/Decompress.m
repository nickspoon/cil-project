function I_rec = Decompress(I_comp)
<<<<<<< HEAD
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
        
%         t1=I_comp.size(1)/d;
%         t2=I_comp.size(2)/d;
% 
%         Xr=otro2(Xr,t1,t2,d);
%         Xg=otro2(Xg,t1,t2,d);
%         Xb=otro2(Xb,t1,t2,d);
        
        I_rec=cat(3,Xr,Xg,Xb);
    elseif isequal(size(I_comp.size,2),2)
        I_rec=full(I_comp.U)*full(I_comp.Z);
        
    end
%     figure ,imshow(uint8(I_rec));
end
% function KK=otro2(X,m,n,d)
%     col=1;
%     KK=[];
%     for i=1:m
%         K=[];
%         for j=1:n
%             K=cat(2,K,reshape(X(:,col),d,d)');
%             col=col+1;
%         end
%         KK=cat(1,KK,K);
%     end
% %     col
% %     KK 
%     
% end
=======
%     data = I_comp.km.means(I_comp.km.data, :);
%     d = I_comp.pca.patch;
%     Xzm = I_comp.pca.eigen * data';
%     X = Xzm' + repmat(I_comp.pca.mean, size(Xzm, 2), 1);
%     
%     I_rec = ones(d*I_comp.pca.blocks(1), d*I_comp.pca.blocks(2));
%     c = I_comp.colours;
%     for k=1:c
%     	for j=1:d
% 		    for i=1:d
% 		    	I_rec(i:d:end, j:d:end, k) = reshape(X(:, i + d*(j-1) + d*d*(k-1)), I_comp.pca.blocks(1), I_comp.pca.blocks(2), 1);
%     		end
%     	end
%     end
%     
%     sz = size(I_rec);
%     
%     % smooth patch edges
%     cbounds = cat(4, I_rec(d-1:d:end-2, :, :), I_rec(d:d:end-1, :, :), I_rec(d+1:d:end-1, :, :), I_rec(d+2:d:end-1, :, :));
%     cbmu = mean(cbounds, 4);
%     I_rec(d:d:end-1, :, :) = cbmu;
%     I_rec(d+1:d:end-1, :, :) = cbmu;
%     cbounds = cat(4, I_rec(:, d-1:d:end-2, :), I_rec(:, d:d:end-1, :), I_rec(:, d+1:d:end, :), I_rec(:, d+2:d:end, :));
%     cbmu = mean(cbounds, 4);
%     I_rec(:, d+1:d:end-1, :) = cbmu;
%     I_rec(:, d:d:end-1, :) = cbmu;
%     
%     % pad to original size
%     padding = I_comp.size - sz(1:2);
    figure, colormap(gray),imagesc(I_comp.U*I_comp.Z);
    I_rec = (I_comp.U*I_comp.Z);
>>>>>>> parent of 0ffba22... Merge branch 'master' of github.com:nickspoon/cil-project
