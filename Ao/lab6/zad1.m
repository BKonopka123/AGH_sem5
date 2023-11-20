clear;
clc;
close all;

im = double(imread("ptaki.jpg"))/255;
gim = rgb2gray(im);

%stworzenie macierzy jak na osttanich zajeciach
r=imbinarize(im(:,:,1),.3);
b=imbinarize(im(:,:,3),.5);
bim=r|~b;
bim=imopen(bim,ones(7));
l=bwlabel(bim);
a=regionprops(l==3,"all");
fm = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska, @AO5RShape};
M=zeros(max(l,[],"all"),length(fm));
for i=1:length(fm)
    for j=1:max(l,[],"all")
        M(j,i)=fm{i}(l==j);
    end
end

%Wartosc oczekiwana i odchylenie
m=mean(M);
S=std(M);
outS=abs(M-m)./S;
t=1.8; %wartosc progowa
outS>t; %wypisanie macierzy logicznej, 1 bedzie dla miejsc w ktorym wartosc>1.8, wartosci nietypowe
out=sum(outS>t,2)>3; %wektor z sumami wartosci nietypowych, 3 to granica wartosci nietypowych
M(out,:)=[]; %usuniecie z macierzy informacji o nietypowej kaczce
indx=find(out);
for i=indx
    l(l==i)=0;
end
bim=l>0;
fm = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska, @AO5RShape};
M=zeros(max(l,[],"all"),length(fm));
for i=1:length(fm)
    for j=1:max(l,[],"all")
        M(j,i)=fm{i}(l==j);
    end
end
%imshow(bim); %tu nie dziala

%binaryzacja i stworzenie amcierzy dla nowego obrazu
im = double(imread("ptaki2.jpg"))/255;
gim = rgb2gray(im);

r=imbinarize(im(:,:,1),.86);
b=imbinarize(im(:,:,3),.67);
bim=r|~b;
bim=imopen(bim,ones(7));
%imshow(bim);
l2=bwlabel(bim);
a=regionprops(l2==3,"all");
fm = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska, @AO5RShape};
M2=zeros(max(l2,[],"all"),length(fm));
for i=1:length(fm)
    for j=1:max(l2,[],"all")
        M2(j,i)=fm{i}(l2==j);
    end
end

%usuniecie niechcianych wartosci z obrazu
m=mean(M2);
S=std(M2);
outS=abs(M2-m)./S;
t=800; 
outS>t; 
out=sum(outS>t,2)>3; 
M2(out,:)=[];
for i=1:max(l2,[],'all')
    a=regionprops(l2==i,'Area');
    if a.Area<t
        l2(l2==i)=0;
    end
end
bim=l2>0;
l2=bwlabel(bim);
imshow(bim);
fm = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska, @AO5RShape};
M2=zeros(max(l2,[],"all"),length(fm));
for i=1:length(fm)
    for j=1:max(l2,[],"all")
        M2(j,i)=fm{i}(l2==j);
    end
end

%siec neuronowa
uin = [M(1:end-2,:);M2(1:end-2,:)]';
n=max(l,[],'all');
n2=max(l2,[],'all');
uout = [repmat([1;0],1,n-2), repmat([0;1],1,n2-2)];
tin=[M(end-1:end,:);M2(end-1:end,:)]';
tout=[1,1,0,0;0,0,1,1];
nm=feedforwardnet;
nm=train(nm,uin,uout);
round(nm(M(5,:)'))
round(nm(tin))

