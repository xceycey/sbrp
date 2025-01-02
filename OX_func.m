function child = OX_func(parent1,parent2,D,p1,p2)
child=zeros(1,D);
child(p1:p2)=parent1(p1:p2);
[~,zero_ind]=find(child==0);
temp_ind=p2+1;
child_ind=p2+1;
while(~isempty(zero_ind))
    if(temp_ind>D)    
        temp_ind=1;  
    end
    if(child_ind>D)   
        child_ind=1;  
    end
    [~,ind]=find(parent2(temp_ind)==child);
    if(isempty(ind))
        child(child_ind)=parent2(temp_ind);
        child_ind=child_ind+1;
    end
    [~,zero_ind]=find(child==0);
    temp_ind=temp_ind+1;
end
end


