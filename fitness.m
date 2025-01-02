function [servisuyg] = fitness(NP,duraksay,arackap,baslangicpop)
uyg=0;
sutun=round(duraksay/arackap);
servisuyg=zeros(NP,sutun);
%uygmatrix=zeros(NP,1);
load distmatrix.mat
for i=1:NP
    k=1;
    m=0;
   for j=1:duraksay-1
       if mod(j,arackap)==0
           continue;
       end
       uyg=uyg+distmatrix(baslangicpop(i,j),baslangicpop(i,j+1));
       if j==arackap-1+m || j==duraksay-1
       uyg=uyg+distmatrix(baslangicpop(i,j+1),duraksay+1);
       servisuyg(i,k)=uyg;
       k=k+1;
       uyg=0;
       m=m+arackap;
       end
       
   end
        
   %uyg=uyg+distmatrix(baslangicpop(i,j),baslangicpop(i,j+1));
   %uygmatrix(i,1)=uyg;

end

