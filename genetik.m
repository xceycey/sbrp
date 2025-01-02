% for qq=1:20
%   disp("-----------------");
%   disp(qq);
global ghandles;
set(ghandles.sonuc, 'String', '');
set(ghandles.radiobuttonPMX, 'Enable', 'off');
set(ghandles.radiobuttonCX, 'Enable', 'off');
set(ghandles.radiobuttonOBX, 'Enable', 'off');
set(ghandles.radiobuttonPBX, 'Enable', 'off');
set(ghandles.radiobuttonUCX, 'Enable', 'off');
set(ghandles.radiobuttonOX, 'Enable', 'off');
load konumlar.mat
toplamsay=length(konumlar(:,1));


NP=40;
ogrsay=toplamsay-1;
arackap=26; 



% figure;
% hold on;
% h=plot(konumlar(561, 2),konumlar(561, 1), 'xr');
% h.LineWidth=3;
% for i = 1:(size(konumlar, 1)-1)
%     plot(konumlar(i, 2),konumlar(i, 1), 'ob');
% end
% plot(konumlar(baslangicpop(1,1),2),konumlar(baslangicpop(1,1),1),'or'); %baþlangýç noktasý
% %plot(konumlar(374,2),konumlar(374,1),'og');
% %plot(konumlar(351,2),konumlar(351,1),'og');
% for d=1:arackap-1
%     x=[konumlar(baslangicpop(1,d),2) konumlar(baslangicpop(1,d+1),2)];
%     y=[konumlar(baslangicpop(1,d),1) konumlar(baslangicpop(1,d+1),1)];
%     plot(x,y,'-');
% end
% x=[konumlar(baslangicpop(1,d+1),2) konumlar(toplamsay,2)];
% y=[konumlar(baslangicpop(1,d+1),1) konumlar(toplamsay,1)];
% plot(x,y,'-');
% 
% %x=[konumlar(5,2) konumlar(5,2)];
% %y=[konumlar(457,1) konumlar(508,1)];
% %plot(x,y,'-');
% grid on;
% hold off;
baslangiczamani = tic;
baslangicpop=[];
%Kümeleme
% okulsuz=konumlar(1:560,:);
% numClusters=10;
% renkler = rand(22, 3); 
% 
% 
% for nn=1:NP
% [clusters, clusterCenters] = kMeansClustering(okulsuz,numClusters,50);
% kumeler=[];
% for i = 1:numel(clusters)
%     eleman = clusters{i};
%     kumeler=vertcat(kumeler,eleman);
%     
% end
% 
% % 
% % 
% % % plot(clusterCenters(:,2),clusterCenters(:,1),'k*');
% % % hold on;
% % % for i = 1:numClusters
% % %   currCluster = clusters{i};
% % %   scatter(currCluster(:,2),currCluster(:,1),20,renkler(i,:), 'filled');
% % % end
% % 
% % 
% ilkpop=[];
% for i=1:size(kumeler,1)
%     index=ismember(okulsuz,kumeler(i,:),'rows');
%     gercekindeks = find(index);
%     ilkpop=[ilkpop,gercekindeks];
%     
% end
% baslangicpop(nn,:)=ilkpop;
% end
% gecensure = toc(baslangiczamani);
% fprintf('Toplam kümeleme süre: %.f\n', gecensure);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure;
% hold on;
% h=plot(konumlar(561, 2),konumlar(561, 1), 'xr');
% h.LineWidth=3;
% % for i = 1:(size(konumlar, 1)-1)
% %     plot(konumlar(i, 2),konumlar(i, 1), 'ob');
% % end
% for j=1:26:548
%     renk=rand(1, 3); 
% for d=j:j+arackap-1
%    scatter(konumlar(baslangicpop(1,d),2),konumlar(baslangicpop(1,d),1),20,renk, 'filled');
% end
% end
% grid on;
% hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Öðrenci konumlarýný yükle
load('konumlar.mat'); 
okulsuz=konumlar(1:560,:);
% Yakýnlýk sýnýrý (mesafeye baðlý olarak durak belirleme)
yakinlik = 0.01; % Örneðin 10 birim içindeki öðrenciler ayný durakta olacak

% Maksimum öðrenci sayýsý bir durakta
max_ogrenci_durakta = 5;

% Kümeleme için boþ bir hücre dizisi oluþtur
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

    % Yeni bir durak oluþtur
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
% disp('Duraklarýn Ortalama Konumlarý ve Öðrenci Sayýlarý:');
% disp(durak_ortalama_konumlar);
duraksay=size(durak_ortalama_konumlar,1);
baslangicpop=zeros(NP,duraksay);
for k=1:NP
    baslangicpop(k,:)=randperm(duraksay);
end

distmatrix=zeros(duraksay);
for i = 1:duraksay
    for j = 1:duraksay
        % Konum farklarýný hesapla
        dx = durak_ortalama_konumlar(i, 1) - durak_ortalama_konumlar(j, 1);
        dy = durak_ortalama_konumlar(i, 2) - durak_ortalama_konumlar(j, 2);
        
        % Öklid uzaklýðýný hesapla
        distmatrix(i, j) = sqrt(dx^2 + dy^2);
    end
end


% load baslangicpop.mat
global caprazlamayontemi;
cx=caprazlamayontemi;
global mutasyonop;
m_op=mutasyonop;
iter=1;
global Itersay;
max_iter=Itersay;
global Crossrate;
global Mutrate;
cx_rate=Crossrate;
m_rate=Mutrate;
global Elitrate;
elit_rate=Elitrate;

fprintf('Ýterasyon sayýsý: %d\n', max_iter);
fprintf('Cx Rate: %d\n', cx_rate);
fprintf('Mut Rate: %d\n', m_rate);
fprintf('Elit Rate: %d\n', elit_rate);
fprintf('Yöntem: %d\n', cx);

baslangiczamani = tic;
sonucpoplar=[];

% cx=input('Çaprazlama türü seçin PMX:1 CX:2 OBX:3\n');
%cx=1;
while iter<=max_iter
servisuygunluk=fitness(NP,duraksay,arackap,baslangicpop);
uygunluksonuc=sum(servisuygunluk,2);

format long;
toplam=sum(uygunluksonuc);
N=uygunluksonuc/toplam;
N(:,2)=cumsum(N,1);
uygunluksonuc=[uygunluksonuc, N];


randomsayi=rand(NP,1);
for i=1:size(randomsayi)
    indexler(i,1)=find(N(:,2) >= randomsayi(i,1),1,'first');
end
for i=1:2:size(indexler)-1
    while indexler(i,1)==indexler(i+1,1)
        yenirandomsayi=rand;
        indexler(i+1,1)=find(N(:,2) >= yenirandomsayi,1,'first');
    end
end
for i=1:2:size(indexler)-1
    if rand()< cx_rate
        continue;
    else
        indexler(i,1)=0;
        indexler(i+1,1)=0;
    end
end
silineceksatirlar = find(all(indexler == 0, 2));
indexler = indexler(setdiff(1:size(indexler, 1), silineceksatirlar), :);

children=zeros(size(indexler,1),duraksay);
if cx==1 %PMX
children = zeros(size(indexler, 1), duraksay);
for i = 1:size(indexler, 1)-1
    % PMX çaprazlama iþlemi
    P1 = baslangicpop(indexler(i, 1), :);
    P2 = baslangicpop(indexler(i+1, 1), :);
    lo = randi(size(P2, 2)-2);
    up = randi([lo+1, size(P2, 2)]);
    child1 = PMX_func(P1, P2, size(P1, 2), lo, up);
    child2 = PMX_func(P2, P1, size(P2, 2), lo, up);
    children(i, :) = child1;
    children(i+1, :) = child2;
end
end

if cx==2 %CycleBasedOX
    for q=1:2:size(indexler,1)-1
        P1=baslangicpop(indexler(q,1),:);
        P2=baslangicpop(indexler(q+1,1),:);
        child1 = cycle_func(P1, P2);
        child2 = cycle_func(P2, P1);
        children(q,:)=child1;
        children(q+1,:)=child2;

    end
end

if cx==3 %OBX
    for q=1:2:size(indexler,1)-1
        P1=baslangicpop(indexler(q,1),:);
        P2=baslangicpop(indexler(q+1,1),:);
        child1 = OBX_func(P1, P2);
        child2 = OBX_func(P2, P1);
        children(q,:)=child1;
        children(q+1,:)=child2;

    end
    
end
if cx==4 %Uniform
     for q=1:2:size(indexler,1)-1
        P1=baslangicpop(indexler(q,1),:);
        P2=baslangicpop(indexler(q+1,1),:);
        [child1,child2] = UCX_func(P1, P2);
        children(q,:)=child1;
        children(q+1,:)=child2;

    end
end
if cx==5 %PBX
    for q=1:2:size(indexler,1)-1
        P1=baslangicpop(indexler(q,1),:);
        P2=baslangicpop(indexler(q+1,1),:);
        child1 = PBX_func(P1, P2);
        child2 = PBX_func(P2, P1);
        children(q,:)=child1;
        children(q+1,:)=child2;

    end
end
if cx==6 %OX
for q=1:2:size(indexler,1)-1
P1=baslangicpop(indexler(q,1),:);
P2=baslangicpop(indexler(q+1,1),:);
lo = randi(size(P2, 2)-2);
up = randi([lo+1,size(P2,2)]);
child1 = OX_func(P1, P2, size(P1,2), lo, up);
child2 = OX_func(P2, P1, size(P1,2), lo, up);
children(q,:)=child1;
children(q+1,:)=child2;

end
end

%Mutasyon
mutchildren=children;
for i=1:size(children,1)
    for j=1:duraksay
        rndm=rand();
        
        if rndm<=m_rate
            if m_op==1 %swap
            swaprnd=randi(duraksay);
            while j==swaprnd
                swaprnd=randi(duraksay);
            end
            gecici=mutchildren(i,j);
            mutchildren(i,j)=mutchildren(i,swaprnd);
            mutchildren(i,swaprnd)=gecici;
            end
            if m_op==2 %insert
                insertrnd = randi(duraksay); % rastgele bir durak seç
            while insertrnd == j
                insertrnd = randi(duraksay); % j ile farklý olacak þekilde tekrar seç
            end
            insert_value = mutchildren(i,j);
            if j < insertrnd
                mutchildren(i, j:insertrnd-1) = mutchildren(i, j+1:insertrnd);
            else
                mutchildren(i, insertrnd+1:j) = mutchildren(i, insertrnd:j-1);
            end
            mutchildren(i,insertrnd) = insert_value;
            end
            if m_op == 3 % inverse
            % Baþlangýç ve bitiþ indekslerini rastgele seç
            start_index = randi(duraksay);
            end_index = randi(duraksay);

            % Baþlangýç ve bitiþ indekslerini kontrol et
            while start_index == end_index
                end_index = randi(duraksay);
            end
            if start_index > end_index
                temp = start_index;
                start_index = end_index;
                end_index = temp;
            end
            mutchildren(i, start_index:end_index) = fliplr(mutchildren(i, start_index:end_index));
            end
            
        else
            continue;
        end
    end
end

parentchild=vertcat(baslangicpop,mutchildren);
servisuygunluk2=fitness(size(parentchild,1),duraksay,arackap,parentchild);
uygunluksonuc2=sum(servisuygunluk2,2);


elitizmsay=NP*elit_rate;
parentchild=[parentchild, uygunluksonuc2];

[~, siralamaIndisleri] = sort(parentchild(:, end));
siraliparentchild = parentchild(siralamaIndisleri, :);

nextpop=siraliparentchild(1:elitizmsay,1:duraksay);

kalanparentchild=siraliparentchild(elitizmsay+1:end,1:duraksay);
servisuygunlukyeni=fitness(size(kalanparentchild,1),duraksay,arackap,kalanparentchild);
uygunluksonucyeni=sum(servisuygunlukyeni,2);
toplam=sum(uygunluksonucyeni);
N=uygunluksonucyeni/toplam;
N(:,2)=cumsum(N,1);
uygunluksonucyeni=[uygunluksonucyeni, N];

secimsay=NP-elitizmsay;
randomsayi=rand(secimsay,1);
for i=1:size(randomsayi,1)
    indexleryeni(i,1)=find(N(:,2) >= randomsayi(i,1),1,'first');
end

k = kalanparentchild(indexleryeni, :);
nextpop=[nextpop;k];

% % Dijkstra
% servisler=[];
% yeniservisler=[];
% for i=1:1
%     for j=1:26:521
%         servis=[];
%         yeniservis=[];
%         for k=j:j+25
% %             if k==546
% %                 break;
% %                 
% %             end
%             % mesafematris(k+1,k)=sqrt((konumlar(nextpop(i,k),1)-konumlar(nextpop(i,k+1),1))^2+(konumlar(nextpop(i,k),2)-konumlar(nextpop(i,k+1),2))^2);
%             servis=[servis nextpop(i,k)];
%             
%         end
%         for ii=1:26
%                 for jj=1:26
%                     mesafelermatrisi(ii,jj)=sqrt((konumlar(servis(1,ii),1)-konumlar(servis(1,jj),1))^2+(konumlar(servis(1,ii),2)-konumlar(servis(1,jj),2))^2);
%                     %disp(sqrt((konumlar(servis(1,ii),1)-konumlar(servis(1,jj),1))^2+(konumlar(servis(1,ii),2)-konumlar(servis(1,jj),2))^2))
%                     %disp(konumlar(servis(1,ii),1))
%                 end
%         end
%             
%        servisler=[servisler;servis];
%        [D, P] = dijk_(mesafelermatrisi,1,26);
%        sortedPath = reconstructPathSorted(1, 26, P, mesafelermatrisi);
%        
%        
% %         for nn=1:size(shortestPath,1)
% %             yeniservis=[yeniservis servis(1,shortestPath(1,nn))];
% %         end
% %         yeniservisler=[yeniservisler shortestPath];
% %         
%         %[mesafeler,yol]=shortestpath(nextpop(i,j+25),nextpop(i,j),nextpop(i,j+25));
%     end
% end

servisuygunlukz=fitness(size(nextpop,1),duraksay,arackap,nextpop);
uygunluksonucz=sum(servisuygunlukz,2);
eniyiyol=min(uygunluksonucz);
copynextpop=nextpop;
copynextpop(:,duraksay+1)=uygunluksonucz(:,1);
if iter==1  || iter==max_iter/4 || iter==max_iter/2  || iter==max_iter*0.75 ||  iter==max_iter 
%     
    fprintf('Ýter: %d\n', iter);
    fprintf('Fitness: %f\n', eniyiyol);
    old_str=get(ghandles.sonuc, 'String');
    tmp_str=[num2str(iter),'. iterasyon fitness: ',num2str(eniyiyol)];
    new_str=[old_str; {tmp_str}];
    set(ghandles.sonuc, 'String', new_str);
    %sonucpoplar=vertcat(sonucpoplar,copynextpop);
    [~, siralamaindex] = sort(copynextpop(:, end));
    siralicopynextpop = copynextpop(siralamaindex, :);
    eniyibirey=siralicopynextpop(1,:);
end


baslangicpop=nextpop;
iter=iter+1;
end
save('mykonumlar.mat', 'konumlar');
save('mydurak_konumlari.mat', 'durak_ortalama_konumlar');
save('myeniyibirey.mat', 'eniyibirey');

gecensure = toc(baslangiczamani);
fprintf('Toplam süre: %.f\n', gecensure);
old_str=get(ghandles.sonuc, 'String');
tmp_str=['Toplam süre: ',num2str(gecensure)];
new_str=[old_str; {tmp_str}];
set(ghandles.sonuc, 'String', new_str);
set(ghandles.checkbox1, 'Enable', 'on');
set(ghandles.checkbox2, 'Enable', 'on');
set(ghandles.checkbox3, 'Enable', 'on');
set(ghandles.checkbox4, 'Enable', 'on');
set(ghandles.checkbox5, 'Enable', 'on');
set(ghandles.checkbox6, 'Enable', 'on');
set(ghandles.radiobuttonPMX, 'Enable', 'on');
set(ghandles.radiobuttonCX, 'Enable', 'on');
set(ghandles.radiobuttonOBX, 'Enable', 'on');
set(ghandles.radiobuttonPBX, 'Enable', 'on');
set(ghandles.radiobuttonUCX, 'Enable', 'on');
set(ghandles.radiobuttonOX, 'Enable', 'on');

% end