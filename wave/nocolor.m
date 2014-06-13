function [x1,sz]=nocolor(i2,d2)
[x,y]=size(i2);
if not(isequal(mod(x,d2),0))
   for j=1:d2-mod(x,d2)
       i2=cat(1,i2,i2(1,:)); 
   end
end
if not(isequal(mod(y,d2),0))
   for j=1:d2-mod(y,d2)
       i2=cat(2,i2,i2(:,1));
   end
end
[x11,y1]=size(i2);
xR=[];
for i=1:d2:x11
    for j=1:d2:y1
        x4=i2(i:i+d2-1,j:j+d2-1);
        x4=x4(:);
        xR=cat(2,xR,x4);     
    end   
end
sz=size(xR);
x1=xR;
end