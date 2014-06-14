function [mu, lambda, U] = PCAanalyse(X)
    mu = mean(X);
    Xzm = X - repmat(mu, size(X, 1), 1);
    Xcov = cov(Xzm);
    [U, D] = eig(Xcov);
    [lambda, order] = sort(diag(D), 'descend');
    U = U(:, order);