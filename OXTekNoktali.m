P1 = [4 7 1 6 5 2 3];
P2 = [1 2 3 4 5 6 7];
% tek nokta ile belirlenen noktadan dizi sonuna kadar olan kismi aliyor.
lo = randi(size(P2, 2)-2);
up = size(P2,2);
new_child1 = OX_func(P1, P2, size(P1,2), lo, up);
new_child2 = OX_func(P2, P1, size(P1,2), lo, up);
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



function child = OX_func2(parent1, parent2, c1, c2)
	
    % crossover parcasi haricini aliyoruz p'ye
	p1 = 1:c1-1;
	p2 = c2 + 1:size(parent1, 2);
	p = [p2 p1];

	child = zeros(1, size(parent1, 2));
	child(c1:c2) = parent1(c1:c2);
    % c2' den sonrasini en basa aliyor. Sonra bastan c2'ye kadar olan kismi
    % ekliyor.
	parent1_ters = [parent1(c2+1:end) parent1(1:c2)];
	parent2_ters = [parent2(c2+1:end) parent2(1:c2)];

	
    % ayni deger tekrari icin kontrol ediliyor. ayni deger varsa 1 doner
    % tersi alinip ekleniyor
	for i = 1:size(parent1_ters, 2)
		m(i,:) = ~ismember(parent2_ters(i), child(c1:c2));
	end
	
	eklenecek_degerler = parent2_ters(m);
    % crossover harici kac degere bakilacaksa o kadar dongu doner
	for j = 1:size(p, 2)
		child(p(j)) = eklenecek_degerler(j);
    end
end