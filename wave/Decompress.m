function I_rec = Decompress(I_comp)
%     X = I_comp.X;
%     d = I_comp.d;
%     
%     I_rec = ones(d*I_comp.blocks(1), d*I_comp.blocks(2));
%     c = I_comp.colours;
%     for k=1:c
%     	for j=1:d
% 		    for i=1:d
% 		    	I_rec(i:d:end, j:d:end, k) = reshape(X(:, i + d*(j-1) + d*d*(k-1)), I_comp.blocks(1), I_comp.blocks(2), 1);
%     		end
%     	end
%     end
%     
%     sz = size(I_rec);
%     
%     % smooth patch edges
%     cbounds = cat(4, I_rec(d-1:d:end-2, :, :), I_rec(d:d:end-1, :, :), I_rec(d+1:d:end-1, :, :), I_rec(d+2:d:end-1, :, :));
%     cbmu = mean(cbounds, 4);
%     I_rec(d:d:end-1, :, :) = cbmu;
%     I_rec(d+1:d:end-1, :, :) = cbmu;
%     cbounds = cat(4, I_rec(:, d-1:d:end-2, :), I_rec(:, d:d:end-1, :), I_rec(:, d+1:d:end, :), I_rec(:, d+2:d:end, :));
%     cbmu = mean(cbounds, 4);
%     I_rec(:, d+1:d:end-1, :) = cbmu;
%     I_rec(:, d:d:end-1, :) = cbmu;
%     
%     % pad to original size
%     padding = I_comp.size - sz(1:2);
%     I_rec = padarray(I_rec, padding, 'replicate', 'post');
    
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
   
    i2_red=otro(i2_red,t1,t2,d);
    i2_green=otro(i2_green,t1,t2,d);
    i2_blue=otro(i2_blue,t1,t2,d);
%     imshow(uint8(i2_green));

<<<<<<< HEAD

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

            HAH=(H'\perro/H)*256;
            HAH2=(H'\perro2/H)*256;
            HAH3=(H'\perro3/H)*256;

            
            
            
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

            HAH=(H'\perro/H)*256;
            X(:,i)=reshape(HAH,1,d*d);
        end
        X=otro2(X,ceil(t1),ceil(t2),d);

        X=X(1:sz(1),1:sz(2));
        I_rec=X;
    end

=======
    i2_red=i2_red(1:sz(1),1:sz(2));
    i2_green=i2_green(1:sz(1),1:sz(2));
    i2_blue=i2_blue(1:sz(1),1:sz(2));
%     I_rec=zeros(sz(1),sz(2),3);
%     imshow(uint8(X));
    I_rec(:,:,1)=i2_red;
    I_rec(:,:,2)=i2_green;
    I_rec(:,:,3)=i2_blue;
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
%     size(I_rec)
% imshow(I_rec);
>>>>>>> parent of 0ffba22... Merge branch 'master' of github.com:nickspoon/cil-project
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
function KK=otro(X,m,n,d)
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
%     col
%     KK 
    
end
