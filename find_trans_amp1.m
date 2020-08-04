function[transamp]=find_trans_amp1(A) 
% finds transient amplifier

transamp=[];


 
 
 d=max(sum(A(:,:,1)));
 

 [~,~,nn3]=size(A);
 
 for j=1:nn3
 
 j
 
 AA=A(:,:,j);


remTime=findRemeetingTimes(AA);


a=find(diag(remTime)==max(diag(remTime)));


b=find(AA(a(1),:)==1);



for i=1:length(b)
Adel=AA;
    
Adel(a(1),b(i))=0;
Adel(b(i),a(1))=0;



leig=eig(diag(sum(Adel))-Adel);


if leig(2)<1e-10
transamp(j,i)=0;

else
remTimedel=diag(findRemeetingTimes(Adel));

transamp(j,i)=sum(Adel)/sum(sum(Adel))*remTimedel;
    
    
end


end
 end