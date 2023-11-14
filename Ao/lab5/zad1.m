clear;
clc;
close all;

im = double(imread("ptaki.jpg"))/255;
gim = rgb2gray(im);

%proba binaryzacji obrazu
bim=imbinarize(gim);
bim=~bim;
%bim=imopen(bim,ones(3));

%wyswietlenie skladowych kolorow w skali szarosci
% subplot(2,3,1);
% imshow(im(:,:,1));
% subplot(2,3,2);
% imshow(im(:,:,2));
% subplot(2,3,3);
% imshow(im(:,:,3));
% subplot(2,3,4);
% imhist(im(:,:,1));
% subplot(2,3,5);
% imhist(im(:,:,2));
% subplot(2,3,6);
% imhist(im(:,:,3));

%zabranie czesci ptakow z poszczegolnych kolorow
r=imbinarize(im(:,:,1),.3);
b=imbinarize(im(:,:,3),.5);
bim=r|~b; %wczesniej bylo r|b ale wyciagane biale i czarne bylo na odwrot wiec trzeba odwrocic niebieski
bim=imopen(bim,ones(7));
% subplot(3,1,1);
% imshow(r);
% subplot(3,1,2);
% imshow(b);
% subplot(3,1,3);
% imshow(bim);

%podzial na segmenty
l=bwlabel(bim);
a=regionprops(l==3,"all"); %wyciaganie wlasnosci pewnego elementu, a to struct

% imshow(a.Image);
%wspolczynnik ksztaltu Ra/Rs, wspolczynnik malinowskiej - Rs/Ra-1,
%wspolczynnik bloir-bliss, wspolczynnik Danielssona, wspolczynnik Haralicka
%wspolczynnik Fereta

%macierz wszytskich spolczyynikow dla wszystkich kaczek
fm = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska, @AO5RShape};
m=zeros(max(l,[],"all"),length(fm));
for i=1:length(fm)
    for j=1:max(l,[],"all")
        m(j,i)=fm{i}(l==j);
    end
end
% m
% imshow(l==8);



