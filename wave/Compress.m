function I_comp = Compress(I)
    d = 256; % patch size
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

