function child = cycle_func(p1,p2)
sz = size(p1,2);
child=zeros(1,sz);
pt=find(p1==1);
while (child(pt)==0)
  child(pt)=p1(pt);
  pt=find(p1==p2(pt));
end
left=find(child==0);
child(left)=p2(left);
end
