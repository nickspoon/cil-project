function I_comp = Compress(I)
    d = 2; % patch size
%     I=double(I);
%     figure, imshow(uint8(I))
    datl=size(I);
    I2=I;
    if isequal(size(datl,2),3)
        [I2,sz]=color(I2,d);
    elseif isequal(size(datl,2),2)
        [I2,sz]=nocolor(I2,d);
    end
%  	X = extract(I, d);

    for i=1:size(I2,2)
        perro=vec2mat(I2(:,i)',d);
%         'perro';
%         size(I);
        [HAH,H]=Harr(perro);
%         size(H);
%         size(HAH);
        HAH=H'\HAH/H;
        I2(:,i)=reshape(HAH,1,d*d);
    end
%     I2=I2';
%     size(I)
    I_comp = struct('d', d, 'X', I2,'size',size(I),'size2',sz,'colours',    size(I2,2));
end
function [X, blocks] = extract(I, d)
    % crop image to a multiple of d
    block_rows = floor(size(I, 1)/d);
    block_cols = floor(size(I, 2)/d);
    blocks = [block_rows, block_cols];
    Ic = I(1:block_rows*d, 1:block_cols*d, :);
    
    c = size(I, 3);
    for k=1:c
    	for j=1:d
		    for i=1:d
    			X(:, i + d*(j-1) + d*d*(k-1)) = reshape(Ic(i:d:end, j:d:end, k), [], 1);
    		end
    	end
    end
end
