% Öðrenci konumlarýný yükle
load('konumlar.mat'); 
okulsuz=konumlar(1:560,:);
% Yakýnlýk sýnýrý (mesafeye baðlý olarak durak belirleme)
yakinlik = 0.01; 
% Maksimum öðrenci syýsý bir durakta
max_ogrenci_durakta = 5;
duraklar = cell(0);

% Her öðrenciyi duraklara atama
for i = 1:size(okulsuz, 1)
    konum = okulsuz(i,:);
    eklendi = false;

    % Mevcut duraklara yakýnlýðý kontrol et
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

% Duraklarýn ortalama konumlarýný ve öðrenci sayýlarýný hesapla
durak_ortalama_konumlar = zeros(numel(duraklar), 3);
for k = 1:numel(duraklar)
    durak_konumlari = duraklar{k};
    durak_ortalama_konumlar(k, 1:2) = mean(durak_konumlari, 1);
    durak_ortalama_konumlar(k, 3) = size(durak_konumlari, 1); % O duraktaki öðrenci sayýsý
end

% Sonuçlarý gösterme
disp('Duraklarýn Ortalama Konumlarý ve Öðrenci Sayýlarý:');
disp(durak_ortalama_konumlar);
