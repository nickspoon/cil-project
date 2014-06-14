function I_rec = Decompress(I_comp)


    d = double(I_comp.d);        
    sz = double(I_comp.size);
    sz2=double(I_comp.size2);
    X=I_comp.X;
    % blocks = floor(sz/d);
    % size(sz)
    if size(sz,2)>=3
        i2_red=X(:,1:(size(X,2)/3));
        i2_green=X(:,(size(X,2)/3)+1:(size(X,2)/3)*2);
        i2_blue=X(:,(size(X,2)/3)*2+1:(size(X,2)/3)*3);

        t1=sz2(1)/d;
        t2=sz2(2)/d;

        i2_red=otro2(i2_red,t1,t2,d);
        i2_green=otro2(i2_green,t1,t2,d);
        i2_blue=otro2(i2_blue,t1,t2,d);
    %     imshow(uint8(i2_green));

        i2_red=i2_red(1:sz(1),1:sz(2));
        i2_green=i2_green(1:sz(1),1:sz(2));
        i2_blue=i2_blue(1:sz(1),1:sz(2));
    %     I_rec=zeros(sz(1),sz(2),3);
    %     imshow(uint8(X));
        I_rec=cat(3,i2_red,i2_green,i2_blue);
    elseif isequal(size(sz,2),2)
    % sz
    % d
        t1=sz(1)/d;
        t2=sz(2)/d;

        X=otro2(X,ceil(t1),ceil(t2),d);
    %     size(X)
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
            K=cat(2,K,reshape(X(:,col),d,d)');
            col=col+1;
        end
        KK=cat(1,KK,K);
    end
%     col
%     KK 
    
end
