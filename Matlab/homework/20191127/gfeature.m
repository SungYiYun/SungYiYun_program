function Out=gfeature(I,a)
% I : 要擷取特徵之影像
% a : 角度設定
% com : 共同出現矩陣
% This function is to calculate the Gray-Tone Spatial-Dependence (co-occurrence) matrix,with distance(d)=1 
% and angle='a'.%The function returns the co-occurrence matrix 'com'.The input 'I' is a matrix,and 'a' string
% can be '0','45','90','135'.
%
% Reference:ROBERT M. HARALICK, K. SHANMUGAM, and ITS'HAK DINSTEIN,"Textural Features for Image Classification",
% IEEE Trans.on System,Man,and Cybernetics,Vol.SMC-3,No.6,Nov 1973.
% Date:0105,2001
% Programmer:c.c.wu
%
% exp:
% I=[0 0 1 1;0 0 1 1;0 2 2 2;2 2 3 3];
% com=gtsdm(I,'0');
%
[m,n]=size(I);
[temp,i,j]=unique(I);
L=length(temp);
temp=[1:L];
newI=reshape(temp(j),m,n);
com=zeros(L,L);

switch a
      %For angle of 0
   case('0'),
      for i=1:m,
         for j=1:n,
            if j+1<n+1,
               com(newI(i,j),newI(i,j+1))=com(newI(i,j),newI(i,j+1))+1;
            end;
            if j-1>0,
               com(newI(i,j),newI(i,j-1))=com(newI(i,j),newI(i,j-1))+1;
            end;
         end;
      end;
      %For angle of 45
   case('45'),
      for i=1:m,
         for j=1:n,
            if (j+1<n+1)&(i-1>0),
               com(newI(i,j),newI(i-1,j+1))=com(newI(i,j),newI(i-1,j+1))+1;
            end;
            if (j-1>0)&(i+1<m+1),
               com(newI(i,j),newI(i+1,j-1))=com(newI(i,j),newI(i+1,j-1))+1;
            end;
         end;
      end;
      %For angle of 90
   case('90'),
      for i=1:m,
         for j=1:n,
            if i+1<n+1,
               com(newI(i,j),newI(i+1,j))=com(newI(i,j),newI(i+1,j))+1;
            end;
            if i-1>0,
               com(newI(i,j),newI(i-1,j))=com(newI(i,j),newI(i-1,j))+1;
            end;
         end;
      end;
      %For angle of 135
   case('135'),
      for i=1:m,
         for j=1:n,
            if (j-1>0)&(i-1>0),
               com(newI(i,j),newI(i-1,j-1))=com(newI(i,j),newI(i-1,j-1))+1;
            end;
            if (j+1<n+1)&(i+1<m+1),
               com(newI(i,j),newI(i+1,j+1))=com(newI(i,j),newI(i+1,j+1))+1;
            end;
         end;
      end;
  end;

 
[m,n]=size(com);
P=com/sum(sum(com));
clear  com;

%Energy
   E=sum(sum(P.^2));
   
%entropy   
   ref=find(P~=0);
   f=P(ref)'*log(P(ref));
   Ent=-f;   
   
%Max.Prob.
   M=max(max(P));
   
%contrast   
   Con=0;
   for i=1:m-1,
      Con=Con+i^2*sum(diag(P,i)+diag(P,-i));
   end;

%inverse difference moment
  InvCon=0;
   for i=1:m-1,
      InvCon=InvCon+sum(diag(P,i)+diag(P,-i))/i^2;
   end;
 %  [x,y]=meshgrid(1:m,1:m);
 %  InvDif=sum(sum((1./(1+(y-x).^2)).*P));
   
%correlation   
   ux=[0:m-1]*sum(P,2);
   uy=sum(P,1)*[0:m-1]';
   sigmax=([0:m-1]-ux).^2*sum(P,2);
   sigmay=sum(P,1)*([0:m-1]'-uy).^2;
   [x,y]=meshgrid(0:m-1,0:m-1);
   ref=x.*y;
   Cor=(sum(sum(ref.*P))-ux*uy)/(sigmax*sigmay);

Out=[E Ent M Con InvCon Cor]';