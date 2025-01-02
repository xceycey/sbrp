function mutated_child = insertion_mutation(child)
    n = length(child);

    pos1 = randi(n);
    pos2 = randi(n);

    moved_gene = child(pos1);
    child(pos1) = [];
    mutated_child = [child(1:pos2-1), moved_gene, child(pos2:end)];
end



