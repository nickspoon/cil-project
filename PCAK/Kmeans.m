function [mu, Z] = Kmeans(D)
    n = 200; % number of data points to sample
    k = 32; % number of colours
    thresh = 0.1; % centroid-change threshold
    dim = size(D, 2); % dimension of data
    % sample data points from D
    A = reshape(D(randsample(size(D,1), n),:), n, 1, dim);
    % sample means
    mu = A(randsample(size(A,1), k),:);
    B = repmat(A, [1, k, 1]);
    while true
        muRep = repmat(reshape(mu, 1, k, dim), [size(B,1), 1, 1]);
        % compute distances to each centroid
        C = B - muRep;
        C = sum(C.^2, 3);
        % obtain centroid assignment
        [~,Z] = min(C, [], 2);
        % create {0,1} assignment matrix
        Zrep = repmat(Z, [1, k]);
        Krep = repmat((1:k), [size(Zrep, 1), 1]);
        ass = (Zrep == Krep);
        % create a separate matrix for each centroid
        X = B;
        X(~repmat(ass,[1, 1, dim])) = 0;
        % find new centroids
        newmu = sum(X) ./ repmat(sum(ass), [1, 1, dim]);
        newmu = reshape(newmu, k, dim);
        % deal with empty centroids
        newmu(isnan(newmu)) = mu(isnan(newmu));
        % compute differences and terminate if small
        diff = abs(newmu - mu);
        if all (diff < thresh)
            break;
        end
        mu = newmu;
    end
    B = repmat(reshape(D, [], 1, dim), [1, k, 1]);
    muRep = repmat(reshape(mu, 1, k, dim), [size(B,1), 1, 1]);
    C = B - muRep;
    C = sum(C.^2, 3);
    [~,Z] = min(C, [], 2);    
