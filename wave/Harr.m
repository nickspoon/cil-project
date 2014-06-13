function [HAH,H]=Harr(I)
    epsi=0.25;
    [M,N]=size(I);
    H=coso(N);
    size(H);
    size(I);
    HAH=H'*I*H;
    HAH=lossVal(HAH,epsi);
%     [M,N]=size(I);
%     H=haarTrans(N);
%     HAH=H*I*H';
%     N2=N;
%     hii=[];
%     hi2=[];
%     I2=I;
%     while N2>1
%         hi=Transfo(I2,M,N2)
%         hii=hi/I2;
%         hi2=cat(2,hi2,hii);
%         I2=hi;
%         N2=N2/2;
%     end
%     H1=hi2(:,1:N);
%     H2=hi2(:,N+1:N*2);
%     H3=hi2(:,(N*2)+1:N*3);
%     H3=H1*H2*H3;
%     HAH=H3'*I*H3;
%     H=H3;
end
function B=lossVal(A,e)
    A(A<=e)=0;
    B=A;
end
function ide=coso(N)
    N2=N;
    ide=eye(N);
    while N2>1
        H=zeros(N);
        col=1;
        for i=1:N
            if i>N2
                H(i,i)=1;
            elseif isequal(mod(i,2),1)
                H(i,col)=1/2;
                H(i,col+(N2/2))=1/2;

            else isequal(mod(i,2),0)
                H(i,col)=1/2;
                H(i,col+(N2/2))=-1/2;
                col=col+1;
            end
        end
        H=ide*H;
        ide=H;
        N2=N2/2;
    end
end
function T=Transfo(I,M,N)
    for i=1:M
       N2=N;
%         while N2>1
            Ro=[];
            Ro2=[];
            for j=1:2:N2
                Ro=[Ro;(I(i,j)+I(i,j+1))/2];
                Ro2=[Ro2;(I(i,j)-I(i,j+1))/2];
            end
            I(i,1:N2)=cat(2,Ro',Ro2');
%             N2=N2/2;
%         end
    end
    T=I;
end