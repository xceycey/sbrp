function child1 = PMX_function(P1, P2, lo, up)
child1=zeros(1,size(P1,2));
% 0 kontrolu icin bir dongu gerekiyor
for k=1:2
fC1=find(P2);

% carprazlama yapilacak kisim aliniyor. P2 den child1 e ataniyor.
for i=lo:up
    child1(i)=P2(fC1(i));
end
for i= lo:up
    a=P1(i); 
    b=child1(i); 
    if (isempty(find(a==child1))&& a~=b)
    ind=find(b==P1);
    if child1(ind)==0
    child1(ind)=a;
    else
        t=P2(ind);
        child1(find(t==P1))=a;
    end 
    end
end
ind_zero=find(child1==0);
if (ind_zero==0)
    continue
else
    break
end
end
for i=1:size(ind_zero,2)
    child1(ind_zero(i))=P1(ind_zero(i));
end
end
