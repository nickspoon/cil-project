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