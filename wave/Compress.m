function I_comp = Compress(I)

    d = 16; % patch size
    epsi=0.01;
    datl=size(I);
    I2=I;
    H=haarTrans(d);
    if isequal(size(datl,2),3)
        [IR,IG,IB,sz]=color(I2,d);
        for i=1:size(IR,2)
            perro=vec2mat(IR(:,i)',d)';
            perro2=vec2mat(IG(:,i)',d)';
            perro3=vec2mat(IB(:,i)',d)';
            
               
               HAH=H*perro*H';
               HAH2=H*perro2*H';
               HAH3=H*perro3*H';
                
               HAH(abs(HAH)<=epsi)=0;
               HAH2(abs(HAH2)<=epsi)=0;
               HAH3(abs(HAH3)<=epsi)=0;
%             [HAH,H]=Harr(perro/256);
%             [HAH2,H2]=Harr(perro2/256);
%             [HAH3,H3]=Harr(perro3/256);

            HAH
            
            
            IR(:,i)=reshape(HAH,1,d*d);
            IG(:,i)=reshape(HAH2,1,d*d);
            IB(:,i)=reshape(HAH3,1,d*d);
        end

        I2=sparse(cat(2,IR,IG,IB));
    elseif isequal(size(datl,2),2)
        [I2,sz]=nocolor(I2,d);
        for i=1:size(I2,2)
            perro=vec2mat(I2(:,i)',d);
            
                HAH=H'*perro*H;
                HAH(abs(HAH)<=epsi)=0;

%             [HAH,H]=Harr(perro/256);

            I2(:,i)=reshape(HAH,1,d*d);
        end
        I2=sparse(I2);
    end
% sum(I2(:)==0)/size(I2,1)/size(I2,2)
    I_comp = struct('d', d, 'data', I2,'size',size(I),'size2',sz,'H',H);
end

