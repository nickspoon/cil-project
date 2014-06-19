function [mu, Z, msd] = Kmeans(D, K)
    n = min(max(floor(size(D, 1)/10), K*5), size(D, 1)); % number of data points to sample
    %n = size(D, 1);
    thresh = 0.05; % centroid-change threshold
    it = 20; % iterate max. 20 times
    dim = size(D, 2); % dimension of data
    % sample data points from D
    A = reshape(D(randsample(size(D,1), n),:), n, 1, dim);
    %A = reshape(D, n, 1, dim);
    % sample means
    mu = A(randsample(size(A,1), K),:);
    B = repmat(A, [1, K, 1]);
    while true
        muRep = repmat(reshape(mu, 1, K, dim), [size(B,1), 1, 1]);
        % compute distances to each centroid
        C = B - muRep;
        C = sum(C.^2, 3);
        % obtain centroid assignment
        [~,Z] = min(C, [], 2);
        % create {0,1} assignment matrix
        Zrep = repmat(Z, [1, K]);
        Krep = repmat((1:K), [size(Zrep, 1), 1]);
        ass = (Zrep == Krep);
        % create a separate matrix for each centroid
        X = B;
        X(~repmat(ass,[1, 1, dim])) = 0;
        % find new centroids
        newmu = sum(X) ./ repmat(sum(ass), [1, 1, dim]);
        newmu = reshape(newmu, K, dim);
        % deal with empty centroids
        newmu(isnan(newmu)) = mu(isnan(newmu));
        % compute differences and terminate if small
        diff = abs(newmu - mu);
        if all (diff < thresh)
            break;
        end
        it = it - 1;
        if (it <= 0)
        	%disp('Did not converge');
        	break;
        end
        mu = newmu;
    end
    B = repmat(reshape(D, [], 1, dim), [1, K, 1]);
    muRep = repmat(reshape(mu, 1, K, dim), [size(B,1), 1, 1]);
    C = B - muRep;
    C = sum(C.^2, 3);
    [D,Z] = min(C, [], 2);
    msd = mean(sum(D.^2,2));
