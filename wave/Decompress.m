function I_rec = Decompress(I_comp)


    d = double(I_comp.d);        
    sz = double(I_comp.size);
    sz2=double(I_comp.size2);
    X=I_comp.data;
    H=I_comp.H;
    % blocks = floor(sz/d);
    % size(sz)
    if size(sz,2)>=3
        i2_red=full(X(:,1:(size(X,2)/3)));
        i2_green=full(X(:,(size(X,2)/3)+1:(size(X,2)/3)*2));
        i2_blue=full(X(:,(size(X,2)/3)*2+1:(size(X,2)/3)*3));
        for i=1:size(i2_red,2)
            perro=vec2mat(i2_red(:,i)',d);
            perro2=vec2mat(i2_green(:,i)',d);
            perro3=vec2mat(i2_blue(:,i)',d);
                
                HAH=H'*perro*H;
                HAH2=H'*perro2*H;
                HAH3=H'*perro3*H;
%             HAH=(H'\perro/H)*256;
%             HAH2=(H'\perro2/H)*256;
%             HAH3=(H'\perro3/H)*256;

            
            
            
            i2_red(:,i)=reshape(HAH,1,d*d);
            i2_green(:,i)=reshape(HAH2,1,d*d);
            i2_blue(:,i)=reshape(HAH3,1,d*d);
        end

        t1=sz2(1)/d;
        t2=sz2(2)/d;

        i2_red=otro2(i2_red,t1,t2,d);
        i2_green=otro2(i2_green,t1,t2,d);
        i2_blue=otro2(i2_blue,t1,t2,d);


        i2_red=i2_red(1:sz(1),1:sz(2));
        i2_green=i2_green(1:sz(1),1:sz(2));
        i2_blue=i2_blue(1:sz(1),1:sz(2));

        I_rec=cat(3,i2_red,i2_green,i2_blue);
    elseif isequal(size(sz,2),2)

        t1=sz(1)/d;
        t2=sz(2)/d;
        X=full(X);
        
        for i=1:size(X,2)
            perro=vec2mat(X(:,i)',d);
            
                HAH=H*perro*H';

%             HAH=(H'\perro/H)*256;
            X(:,i)=reshape(HAH,1,d*d);
        end
        X=otro2(X,ceil(t1),ceil(t2),d);

        X=X(1:sz(1),1:sz(2));
        I_rec=X;
    end

end
function KK=otro2(X,m,n,d)
    col=1;
    KK=[];
    for i=1:m
        K=[];
        for j=1:n
            K=cat(2,K,reshape(X(:,col),d,d));
            col=col+1;
        end
        KK=cat(1,KK,K);
    end

end