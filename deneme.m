% % Örnek ebeveyn kromozomlarý
% P1 = [1 2 3 4 5 6 7 8 9];
% P2 = [5 4 6 9 2 1 7 8 3];
% 
% % Çaprazlama aralýðý
% lo = 3;
% up = 6;
% 
% % PMX fonksiyonunu kullanarak iki çocuk oluþtur
% child1 = PMX_function(P1, P2, lo, up);
% child2 = PMX_function(P2, P1, lo, up);
% 
% % Sonuçlarý ekrana yazdýr
% disp('Ebeveyn 1:');
% disp(P1);
% disp('Ebeveyn 2:');
% disp(P2);
% disp('Çocuk 1:');
% disp(child1);
% disp('Çocuk 2:');
% disp(child2);

% P1 = [1 2 3 4 5 6 7 8 9];
% P2 = [9 3 7 8 2 6 5 1 4];
% child1 = OBX_func(P1, P2);
% child2 = OBX_func(P2, P1);

load konumlar.mat

format long;
x= 37.82338698193422 + (37.92105200814699-37.82338698193422) *rand(560,1);
y= 32.42483626808257 +(32.54176419841556 - 32.42483626808257)*rand(560,1);
train=[x,y];

okulsuz=konumlar(1:560,:);

numClusters=22;
[clusters, clusterCenters] = kMeansClustering(okulsuz,numClusters,100);


% colors = {'ro','bo','go','yo','mo','co','ko'};
% colors = {'ro','bo','go','yo','mo','co','ko','r+','b+','g+','y+','m+','c+','k+','rx','bx','gx','yx','mx','cx','kx','r*'};
renkler = rand(22, 3); 

kumeler=[];
for i = 1:numel(clusters)
    eleman = clusters{i};
    kumeler=vertcat(kumeler,eleman);
    
end



plot(clusterCenters(:,2),clusterCenters(:,1),'k*');
hold on;
for i = 1:numClusters
  currCluster = clusters{i};
   scatter(currCluster(:,2),currCluster(:,1),20,renkler(i,:), 'filled');
end





