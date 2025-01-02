function [child1, child2] = UCX_func(parent1, parent2)
    n = length(parent1);
    child1 = zeros(1, n);
    child2 = zeros(1, n);

    % Rastgele maske oluþturma
    mask = randi([0, 1], 1, n);

    for i = 1:n
        if mask(i) == 1
            child1(i) = parent1(i);
            child2(i) = parent2(i);
        else
            child1(i) = parent2(i);
            child2(i) = parent1(i);
        end
    end
end


