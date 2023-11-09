clear;
clc;
close all;

%wczytanie kaczek i binaryzacja - kaczki biale, tlo czarne
im = rgb2gray(double(imread("kaczki.jpg"))/255);
t=graythresh(im);
bim=im;
bim(bim<t)=0;
bim(bim>=t)=1;
bim=1-bim;
bim=imclose(bim,ones(15));
%imshow(bim);

%morfologia - rozne funkcje (clean - pozbywa sie bialych pikseli, fill - pozbywa sie pojedynczych czarnych pikseli, open i close tak samo jak wyzej ale mniej dokladne bo bez parametrow, remove - usuwa wnetrze zostaje krawedz, tak jak w filtrze krawedziowym)

rim=bwmorph(bim,"remove"); %znalezienie ksztaltu, usuniecie wypelnienia
%imshow(rim);

sk=bwmorph(bim,"skeleton",inf); %wytworzenie szkieletu obrazka, przy kilkudziesieciu razach (37) przestaje sie redukowac, im wieksza rozdzielczosc tym wiecej razy trzeba zrobic, zamiast liczby inf
%imshow(sk);

%imshow(bwmorph(sk,"endpoints")); %znalezienie punktow z konca linii na szkielecie

%imshow(bwmorph(sk,"branchpoints")); %znalezienie skrzyzowan - punktow przeciecia linii

%[y,x]=find(pt==1); %znalezienie wpsolrzednych punktow o wartosci 1

%dzialanie na pelnym ksztalcie, wyzej na szkielecie
%imshow(bwmorph(bim,"shrink",inf)); %cos na zasadzie erozji, zwezanie kaczki, na samym koncu pojedyncze piksele, majac jeden piksel mozemy wiedziec gdzie ktora kaczka sie znajdowala, punkt to nie srodek masy, piksel nalezy do kaczki

%imshow(bwmorph(bim,"thin",inf)); %pewien inny typ erozji, tak jak wyzej zapewniamy ze nie zostanie usuniety caly obraz, zostaje cala linia o grubosci 1, wyzej zostaej piksel

%liczba eulera - ilosc obiektow - ilosc dziur - wazne zachowanie tej
%liczby, thin i shrink zachowuja ta liczbe, ilosc obiekt-dziura taka sama,
%wazne zeby sie nie robily dziury

%imshow(bwmorph(bim,"thicken",inf)); %dylatacja inna, przy inf zaznacza obszary (segmenty), kaczki sie nie zlacza, w kazdym z obszarow jest dokladnie 1 obiekt, segmentacja przez pogrubianie

l = bwlabel(bim); %macierz oznaczajaca liczbami kazda kaczke - 0 - tlo, 1-pierwsza kaczka, 2-druga kaczka itd (wszystko zapisane w macierzy)
%imshow(label2rgb(l)); %nadanie kazdemu segmentowi osobnego koloru
%imshow(l==2); %wyswieltenie tylko 2 kaczki
%imshow((l==2).*im); %uzycie l==2 segmentu, jako maski, zeby pokazac oryginalna kaczke, nie ksztalt

%segmentyzacja i kolorwe wyswietlenie segmentow na thin i thicken
seg1=bwmorph(bim,"thin",inf);
seg2=bwmorph(bim,"thicken",inf);
l1 = bwlabel(seg1);
l2 = bwlabel(seg2);
%imshow(label2rgb(l1));
%imshow(label2rgb(l2));
%mozliwosc podzialu obrazu na im - kolory, bim - ksztalty, l -segmenty

%transformata odleglosciowa
%bim=1-bim; - najjasniejsze miejsca przy inwersji to szkielet
bim(:,[1,end])=1; %dodanie sztucznego obiektu na rogach obrazu, zeby nie robilo sie bardzo jasno na krancach obrazu, widac szkielet tla, zlewisko to bszar, granica miedyz nimi to granica wododzialowa/wododzial
bim([1,end],:)=1;
d=bwdist(bim, "chessboard"); %funkcja realizujaca transformate - im dalej od kaczki tym jasniej, rozne spoosby liczenia odleglosci, standardowo 'euclidian'
maxd=max(d,[],"all"); %maksimum i wyswietlenie w odpowiednich przedzialach
imshow(d,[0,maxd]);
l=watershed(d); %wododzial
imshow(label2rgb(l));






