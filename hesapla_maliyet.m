function maliyet = hesapla_maliyet(route, konumlar)
    maliyet = 0;
    n = length(route);
    if n > 1
        for k = 1:(n - 1)
            if route(k) <= size(konumlar, 1) && route(k+1) <= size(konumlar, 1)
                maliyet = maliyet + sqrt((konumlar(route(k), 1) - konumlar(route(k+1), 1))^2 + (konumlar(route(k), 2) - konumlar(route(k+1), 2))^2);
            else
                error('Index exceeds matrix dimensions in hesapla_maliyet function.');
            end
        end
        if route(end) <= size(konumlar, 1) && route(1) <= size(konumlar, 1)
            maliyet = maliyet + sqrt((konumlar(route(end), 1) - konumlar(route(1), 1))^2 + (konumlar(route(end), 2) - konumlar(route(1), 2))^2); % Dönüþ maliyeti
        else
            error('Index exceeds matrix dimensions in hesapla_maliyet function.');
        end
    end
end
