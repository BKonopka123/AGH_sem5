clear;
clc;
close all;

im = rgb2gray(double(imread("opera.jpg"))/255);

%transformata Fouriera
fim = fft2(im);

A=abs(fim);
maxA=max(A,[],"all");
phi=angle(fim);
%imshow(log(A),[0,log(maxA)]); %widmo amplitudowe

%A(5,8)=10^5; %zmiana funkcji
%subplot(2,1,1);
%imshow(fftshift(log(A)), [0,log(maxA)]); %widmo amplitudowe z przesunietymi cwiartkami

%z=A.*exp(1i*phi); %transformata odwrotna
%im2=abs(ifft2(z));
%subplot(2,1,2);
%imshow(im2);

%imshow(phi,[-pi,pi]);

%filtr i jego transformata
f=ones(7)/49;
[h,w]=size(im);
ff=fft2(f,h,w);
Af=abs(ff);
phif=angle(ff);
%A=A.*Af;

maxAf=max(Af,[],"all");
minAf=min(Af,[],"all");
%imshow(log(Af),log([minAf,maxAf]));
%imshow(phif,[-pi,pi]);

%kompresja maska
m=zeros(h,w);
m(h/2-200:h/2+200, w/2-200:w/2+200)=1;
m=fftshift(m);
%A=A.*m;



z=A.*exp(1i*phi); %transformata odwrotna
im2=abs(ifft2(z));
imshow(im2);






