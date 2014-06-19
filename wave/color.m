function [x1,sz]=color(i2,d2)
[x,y,z]=size(i2);
i2_red=i2(:,:,1);
i2_green=i2(:,:,2);
i2_blue=i2(:,:,3);
% imshow(uint8(i2_red));
if not(isequal(mod(x,d2),0));
   for j=1:d2-mod(x,d2)
       i2_red=cat(1,i2_red,i2_red(1,:));
       i2_green=cat(1,i2_green,i2_green(1,:));
       i2_blue=cat(1,i2_blue,i2_blue(1,:));
   end
end
if not(isequal(mod(y,d2),0));
   for j=1:d2-mod(y,d2)
       i2_red=cat(2,i2_red,i2_red(:,1));
       i2_green=cat(2,i2_green,i2_green(:,1));
       i2_blue=cat(2,i2_blue,i2_blue(:,1));
   end
end
sz=size(i2_red);
x3=cat(2,i2_red,i2_green,i2_blue);
[x11,y1]=size(x3);
xR=[];
for i=1:d2:x11
    for j=1:d2:y1
        x4=x3(i:i-1+d2,j:j-1+d2)';
        x4=x4(:);
        xR=cat(2,xR,x4);
  
    end
end
x1=xR;
end

