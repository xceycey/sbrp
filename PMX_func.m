function child = PMX_func(parent1,parent2,D,p1,p2)
child=zeros(1,D);
child(p1:p2) = parent1(p1:p2);

for p=p1:p2
    [~,cur_ind]=find(parent2(p)==child);
    if(isempty(cur_ind)) 
        [~,ind]=find(parent2==parent1(p));
        while(p1<=ind && ind<=p2)
            %fprintf("\nind : %d", ind);
            [~,ind]=find(parent2==parent1(ind));
        end
        if(ind<p1 || ind>p2)
            child(ind)=parent2(p);
        end
    end
end
[~,zero_ind]=find(child==0);
child(zero_ind)=parent2(zero_ind);
end