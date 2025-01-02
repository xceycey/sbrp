function mutated_child = inverse_mutation(child)
    n = length(child);

    % Rastgele iki farklý pozisyon seç
    pos1 = randi(n);
    pos2 = randi(n);
    
    if pos1 > pos2
        temp = pos1;
        pos1 = pos2;
        pos2 = temp;
    end
    % pos1 ve pos2 arasýndaki genleri ters çevir
    child(pos1:pos2) = fliplr(child(pos1:pos2));
    mutated_child = child;
end


