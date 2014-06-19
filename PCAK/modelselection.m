data = [];
for pcadim = 1:16
	for psize = 3:16
		disp(['PCA dimensions: ' num2str(pcadim) ', patch size: ' num2str(psize)]);
		EvaluateCompression;
		data(pcadim, psize, :) = Result;
	end
end
