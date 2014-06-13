function X = extract(I, d)
    % crop image to a multiple of d
    block_rows = floor(size(I, 1)/d);
    block_cols = floor(size(I, 2)/d);
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
    