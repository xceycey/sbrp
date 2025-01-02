function child = OBX_func(parent1,parent2)
    [~,c] = size(parent1);
    child(1,1:c) = -1;
    
    % random indeksleri belirleme
    set = ceil(1 + (c-1)*rand(1,1));
    
    selectedPositions = randperm(set);
    selectedinP1 = parent1(selectedPositions);
    
    % se�ili indislerdeki de�erler harici p2 den �ocu�a aktar�l�yor.p2'deki
    % yerleri ayn� kalacak �ekilde.
    for i=1:c
        if (isempty(find(selectedinP1==parent2(1,i), 1)))
            child(1,i) = parent2(1,i);
        end
    end
    
    % se�ili indislerdeki de�erler s�ras�yla �ocuktaki bo�luklara
    % yerle�tiriliyor.
     for i=1:c
        if (~isempty(find(selectedinP1==parent1(1,i), 1)))
            for j=1:c
                if (child(1,j)==-1)
                    child(1,j) = parent1(1,i);
                    break;
                end
            end
        end
    end
    
end