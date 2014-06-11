function [U,Z]=NoNMF(I)

    %
    d=20;
    figure, colormap(gray),imagesc(I);
%     [I,blocks]=extract(I,d);
    k=10;
    I=double(I);
    [D,N]=size(I);
    U=randi(256,D,k);
    Z=randi(256,k,N);
    for h=1:5000
        Xz_uuz=(I*Z')./((U*Z)*Z');
        Ux_uuz=(U'*I)./(U'*U*Z);
        for i=1:D
            for j=1:k
                U(i,j)=U(i,j)*Xz_uuz(i,j);
            end
        end
        for ii=1:k
            for jj=1:N
                Z(ii,jj)=Z(ii,jj)*Ux_uuz(ii,jj);
            end
        end
    end
    fin=U*Z;
%     br_vec = ones(1, size(fin, 1));
%     bc_vec = size(fin, 2);
%     C = mat2cell(fin, br_vec, bc_vec);
%     Cr = cellfun(@(c) reshape(c, d, d, size(I,3)), C, 'UniformOutput', false);
%     Cr = reshape(Cr, [blocks(1),blocks(2)]);
%     fin = cell2mat(Cr);
    %colormap(gray);
    figure, colormap(gray),imagesc(fin);

end
function [X, blocks] = extract(I, d)
    % crop image to a multiple of d
    block_rows = floor(size(I, 1)/d);
    block_cols = floor(size(I, 2)/d);
    blocks = [block_rows, block_cols];
    Ic = I(1:block_rows*d, 1:block_cols*d, :);
    % convert to a cell matrix of patches
    br_vec = [d * ones(1, block_rows)];
    bc_vec = [d * ones(1, block_cols)];
    colours = size(I, 3);
    if colours == 1
        C = mat2cell(Ic, br_vec, bc_vec);
    else
        C = mat2cell(Ic, br_vec, bc_vec, size(I, 3));
    end
    % reshape each cell to a 'vector'
    Cr = cellfun(@(c) reshape(c, 1, d*d*size(I,3)), vertcat(C(:)), 'UniformOutput', false);
    X = cell2mat(Cr);
end