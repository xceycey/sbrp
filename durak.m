% ��renci konumlar�n� y�kle
load('konumlar.mat'); 
okulsuz=konumlar(1:560,:);
% Yak�nl�k s�n�r� (mesafeye ba�l� olarak durak belirleme)
yakinlik = 0.01; 
% Maksimum ��renci sy�s� bir durakta
max_ogrenci_durakta = 5;
duraklar = cell(0);

% Her ��renciyi duraklara atama
for i = 1:size(okulsuz, 1)
    konum = okulsuz(i,:);
    eklendi = false;

    % Mevcut duraklara yak�nl��� kontrol et
    for j = 1:numel(duraklar)
        durak_konumlari = cat(1, duraklar{j});
        uzaklik = pdist2(konum, durak_konumlari);

        if any(uzaklik <= yakinlik) && size(durak_konumlari, 1) < max_ogrenci_durakta
            duraklar{j} = [duraklar{j}; konum];
            eklendi = true;
            break;
        end
    end

    if ~eklendi
        duraklar{end+1} = konum;
    end
end

% Duraklar�n ortalama konumlar�n� ve ��renci say�lar�n� hesapla
durak_ortalama_konumlar = zeros(numel(duraklar), 3);
for k = 1:numel(duraklar)
    durak_konumlari = duraklar{k};
    durak_ortalama_konumlar(k, 1:2) = mean(durak_konumlari, 1);
    durak_ortalama_konumlar(k, 3) = size(durak_konumlari, 1); % O duraktaki ��renci say�s�
end

% Sonu�lar� g�sterme
disp('Duraklar�n Ortalama Konumlar� ve ��renci Say�lar�:');
disp(durak_ortalama_konumlar);
