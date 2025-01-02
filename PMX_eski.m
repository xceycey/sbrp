for q=1:2:size(indexler,1)-1
P1=baslangicpop(indexler(q,1),:);
P2=baslangicpop(indexler(q+1,1),:);
child1=zeros(1,ogrsay);
child2=zeros(1,ogrsay);
for k=1:10%replace 10 and increase number if here infinity if problem d=0;
fC1=find(P2);
for i=1:10%%replace 10 and increase number if here infinity if problem with r1==r2
r=randi([2,size(P2,2)-1],1,2);
lo=min(r);
up=max(r);
%lo=3;
%up=5;
if lo==up
     continue
else
   break
end
end
for i=lo:up
    child1(i)=P2(fC1(i));
end
for i= lo:up
    a=P1(i);%2
    b=child1(i);%5
    G=find(a==child1);
    if isempty(G)&& a~=b
    Z=find(b==P1);
    if child1(Z)==0
    child1(Z)=a;
    else
        t=P2(Z);%7
        Z=find(t==P1);%3
        child1(Z)=a;
    end 
    end
end
d=find(child1==0);%here deal with matrix size and also embed if the position is already occupied.....
if (d==0)
    continue
else
    break
end
end
for i=1:size(d,2)
    child1(d(i))=P1(d(i));
end
children(q,:)=child1;
fC2=find(P1);
for k=1:10
for i=lo:up
    child2(i)=P1(fC2(i));
end
for i= lo:up
    a=P2(i);%7
    b=child2(i);%5
    G=find(a==child2);
    if isempty(G)&& a~=b
    Z=find(b==P2);
    if child2(Z)==0
    child2(Z)=a;
    else
        t=P1(Z);%7
        Z=find(t==P2);%3
        child2(Z)=a;
    end 
    end
end
d=find(child2==0);%here deal with matrix size and also embed if the position is already occupied.....
if (d==0)
    continue
else
    break
end
end
for i=1:size(d,2)
    child2(d(i))=P2(d(i));
end
children(q+1,:)=child2;
end