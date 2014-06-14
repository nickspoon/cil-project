function I_comp = Compress(I)
    d = 4; % patch size
%     I=double(I);
%     figure, imshow(uint8(I))
    datl=size(I);
    I2=I;
    if isequal(size(datl,2),3)
        [IR,IG,IB,sz]=color(I2,d);
        for i=1:size(IR,2)
            perro=vec2mat(IG(:,i)',d);
            perro2=vec2mat(IG(:,i)',d);
            perro3=vec2mat(IB(:,i)',d);
    %         'perro';
    %         size(I);
            [HAH,H]=Harr(perro);
            [HAH2,H2]=Harr(perro2);
            [HAH3,H3]=Harr(perro3);
    %         size(H);
    %         size(HAH);
            HAH=H'\HAH/H;
            HAH2=H2'\HAH2/H2;
            HAH3=H3'\HAH3/H3;
            IR(:,i)=reshape(HAH,1,d*d);
            IG(:,i)=reshape(HAH2,1,d*d);
            IB(:,i)=reshape(HAH3,1,d*d);
        end
        I2=cat(2,IR,IG,IB);
    elseif isequal(size(datl,2),2)
        [I2,sz]=nocolor(I2,d);
        for i=1:size(I2,2)
            perro=vec2mat(I2(:,i)',d);
    %         'perro';
    %         size(I);
            [HAH,H]=Harr(perro);
    %         size(H);
    %         size(HAH);
            HAH=H'\HAH\H;
            I2(:,i)=reshape(HAH,1,d*d);
        end
    end

    I_comp = struct('d', d, 'X', I2,'size',size(I),'size2',sz);
end

