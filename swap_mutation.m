function mutated_child = swap_mutation(child)
    n = length(child);

    % Rastgele iki farklý pozisyon seç
    pos1 = randi(n);
    pos2 = randi(n);
 
    while pos1 == pos2
        pos2 = randi(n);
    end
    temp = child(pos1);
    child(pos1) = child(pos2);
    child(pos2) = temp;

    mutated_child = child;
end



