function [HAH,H]=Harr(I)
    epsi=0.1;
    [M,N]=size(I);
    H=coso(N);

    HAH=H'*I*H;
    HAH=lossVal(HAH,epsi);

end
function B=lossVal(A,e)
    A(abs(A)<=e)=0;
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
            elseif isequal(mod(i,2),1);
                H(i,col)=1/2;
                H(i,col+(N2/2))=1/2;

            else isequal(mod(i,2),0);
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
% function T=Transfo(I,M,N)
%     for i=1:M
%        N2=N;
% %         while N2>1
%             Ro=[];
%             Ro2=[];
%             for j=1:2:N2
%                 Ro=[Ro;(I(i,j)+I(i,j+1))/2];
%                 Ro2=[Ro2;(I(i,j)-I(i,j+1))/2];
%             end
%             I(i,1:N2)=cat(2,Ro',Ro2');
% %             N2=N2/2;
% %         end
%     end
%     T=I;
% end