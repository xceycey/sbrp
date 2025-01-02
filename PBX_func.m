function child = PBX_func(parent1,parent2)
    [~,c] = size(parent1);
    child(1,1:c) = -1;
    
    % random indeksler belirleniyor.
    set = ceil(1 + (c-1)*rand(1,1));
    
    selectedPositions = randperm(set);
    selectedinP1 = parent1(selectedPositions);
    
    % se�ili indislerdeki de�erler p1 den �ocu�a aktar�l�yor.
    for i=1:c
        if (~isempty(find(selectedinP1==parent1(1,i), 1)))
            child(1,i) = parent1(1,i);
        end
    end
    
     % se�ili indislerdeki de�erler haricinde p2 de kalan de�erler s�ras�yla �ocu�a
     % ekleniyor.
     for i=1:c
        if (isempty(find(selectedinP1==parent2(1,i), 1)))
            for j=1:c
                if (child(1,j)==-1)
                    child(1,j) = parent2(1,i);
                    break;
                end
            end
        end
    end
    
end