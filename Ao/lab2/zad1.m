clear;
clc;
close all;

im=rgb2gray(double(imread("zubr.jpg"))/255);

%filtr dolnoprzepustowy - srednia - obraz sie rozmywa
k=3;
f=ones(k)/k^2; %macierz sasiedctwa
fim = imfilter(im,f);
%subplot(2,1,1); 
%imshow(im);
%subplot(2,1,2);
%imshow(fim);

%macierz z -1 - filtr gornoprzepustowy - wyostrzanie
f=-ones(k);
f((k+1)/2,(k+1)/2)=k^2-1; %wagi sumuja sie do 0 - krawedzie jasne - wykrywanie krawedzi, jezeli sumuja sie do 1 to wyostrzenie = k^2
fim = imfilter(im,f);
%subplot(2,1,1); 
%imshow(im);
%subplot(2,1,2);
%imshow(fim);

%filtr medianowy - krawedzie pozsotaja ostre
fim=medfilt2(im,[k,k]);
%subplot(2,1,1); 
%imshow(im);
%subplot(2,1,2);
%imshow(fim);

%zmiana na binarny - binaryzacja
t=.5;
t=graythresh(im); %odpowiedni prog 0.4706
bim=im;
bim(bim<t)=0;
bim(bim>=t)=1;
bim=1-bim; %inwersja
%subplot(2,2,1); 
%imshow(im);
%subplot(2,2,2);
%imshow(bim);
%subplot(2,2,3); 
%imhist(im);
%subplot(2,2,4);
%imhist(bim);

%binaryzacja funkcja - typ logiczny obrazka
bim=imbinarize(im); %adaptive liczy tylko w oytoczeniu - dobre do kartek z tekstem
bim=~bim;
%subplot(2,1,1); 
%imshow(im);
%subplot(2,1,2);
%imshow(bim);

%uzycie mediany na zbinaryzownym obrazie - zlanie sie pikseli
fim=medfilt2(bim,[k,k]);
%subplot(2,1,1); 
%imshow(bim);
%subplot(2,1,2);
%imshow(fim);

%operacje morfologiczne - na ksztaltach - max i min

%morfologiczna erozja
fim=imerode(bim,ones(3));
%subplot(2,1,1); 
%imshow(fim);

%morfologiczna dylatacja
fim=imdilate(bim,ones(3));
%subplot(2,1,2); 
%imshow(fim);

fim=imopen(bim,ones(7)); %najpierw erozja potem dylatacja
%subplot(2,1,1); 
%imshow(fim);
fim=imclose(bim,ones(7)); %najpierw dylatacja potem erozja
%subplot(2,1,2); 
%imshow(fim);

%wyrysowanie krawedzi - usuniecie erozji
fim = bim - imerode(bim,ones(3));
%imshow(fim);

%wyciecie zubra - przemnozenie macierzy - maskowanie
%imshow(im.*bim);

%fspecial - dokumentacja

