clear;
clc;
close all; %zamkniecie wszystkich otwartych okien

im=imread('zubr.jpg'); %macierz o wymiarach h,w,3 - wysokosc, szerokosc, dane o kolorach (unit8 -> 0-255)
im = double(im)/255; %zmiana wartosci unit8 na double - wiecej operacji na liczbach, ale zakres imshow sie zmienia z 0-255 do 0-1 wiec wszystko jest biale (odczytywna maksymalna wartosc - bialy kolor)
%dzielenie przez 255 pozwala miec odpowiedni zakres do wyswietlenia obrazu jako double
%imshow(im); %wyswietlenie obrazu - imshow nie wyswietla wykresow - tylko zdjecia

%wyswietlenie 2 obrazkow na raz
figure; %otworzenie nowego okna, trzeba je zamykac recznie
imshow(im);
subplot(2,1,1); %otworzenie 2 obrazow w jednym oknie - h-ilosc okien w wysokosci, w-szeokosci, i-na ktorym obszarze dzialamy
imshow(im);
subplot(2,1,2);
imshow(im);

greenim = im; %skopiowanie obrazka
greenim(:,:,[1,3])=0; %zmiana na sama warstwe zielona
subplot(1,2,1);
imshow(greenim);
subplot(1,2,2);
imshow(im(:,:,2)); %interpretuje jako szarosc a nie zielony

%wyswietlenie 3 warstw kolorow w skali szarosci 
subplot(2,3,1);
imshow(im(:,:,1));
subplot(2,3,2);
imshow(im(:,:,2));
subplot(2,3,3);
imshow(im(:,:,3));

%wyswietlenie histogramu
subplot(2,3,4);
imhist(im(:,:,1));
subplot(2,3,5);
imhist(im(:,:,2));
subplot(2,3,6);
imhist(im(:,:,3));

%wyswiwtlenie obrazu w skali szarosci
greyim=mean(im,3); %srednia arytmetyczna - usredniamy w 3 kierunku (kolory, domyslnie 1), mozna wziac dowolna inna funkcje akumulacyjna - bierze duzo wartosci i daje jedna
subplot(2,3,1);
imshow(greyim);
%standard YUV  -wagi kolorow wedlug naszej interpretacji swiatla
subplot(2,3,2);
YUV=[.299,.587,.114];
YUV=permute(YUV,[1,3,2]); %funkcja do obrotu macierzy - 3 wymiar, wektor to sposob obrotu
greyim2=sum(im.*YUV,3); %srednia waznona obrazka im - YUV to wagi
imshow(greyim2);
%wbudowana funkcja
subplot(2,3,3);
grayim3=rgb2gray(im);
imshow(grayim3);

subplot(2,3,4);
imhist(greyim);
subplot(2,3,5);
imhist(greyim2);
subplot(2,3,6);
imhist(grayim3);


%dzialanie na -jasnosc, kontrast, gamma

%jasnosc +
b=.2;
bim = grayim3 + b; %zwiekszenie jasnosci o 2 
bim(bim>1)=1; %ograniczenie - zeby nie wyszlo poza skale
bim(bim<0)=0;

subplot(3,2,1);
imshow(grayim3);
subplot(3,2,2);
imshow(bim);
subplot(3,2,3);
imhist(grayim3);
subplot(3,2,4);
imhist(bim);
%wyrysowanie wykresu zmiany
subplot(3,2,5);
x=0:1/255:1;
y=x+b;
y(y>1)=1;
y(y<0)=0;
plot(x,y); %wykres jest przesuniety
ylim([0,1]);

%kontrast *
c=0.5; %mniejsxe od 1 -histogram sie zweza, wieksze od 1 - rozszerza sie - tracenie informacji
cim = grayim3 * c; %0 sie nie zmienia, mozna obrac inny taki punkt - dodanie stalej (zawsze jedna wartosc ktora sie nie zmienia)
cim(cim>1)=1;

subplot(3,2,1);
imshow(grayim3);
subplot(3,2,2);
imshow(cim);
subplot(3,2,3);
imhist(grayim3);
subplot(3,2,4);
imhist(cim);
%wyrysowanie wykresu zmiany
subplot(3,2,5);
x=0:1/255:1;
y=x*c;
y(y>1)=1;
plot(x,y); %wykres jest pochylony
ylim([0,1]);

%gamma ^
g=.5;
gim=grayim3.^g; %czesto zamiast g daje sie 1/g zeby przy rosnacych liczbach obrazek jasnial a nie ciemnial

subplot(3,2,1);
imshow(grayim3);
subplot(3,2,2);
imshow(gim);
subplot(3,2,3);
imhist(grayim3);
subplot(3,2,4);
imhist(gim);
%wyrysowanie wykresu zmiany
subplot(3,2,5);
x=0:1/255:1;
y=x.^g;
plot(x,y); %dla 0.5 - rozciagneicie ciemnych wartosci z przedzialu 0-0.5 do 0-0.75 i zwezenie jasnych wartosci od przedzailu 0.5-1 do 0.75 do 1
%dla g=2 analogicznie tylko w 2 strone
ylim([0,1]);

%b=(-1;1)
%c=(0;nieskonczonosc) suwak logarytmem
%g=(0;nieskonczonosc)

%wyrowannie histogramu - tracimy informacje - do wyswietlania
him=histeq(gim);
subplot(2,2,1);
imshow(gim);
subplot(2,2,2);
imshow(him);
subplot(2,2,3);
imhist(gim);
subplot(2,2,4);
imhist(him);s





