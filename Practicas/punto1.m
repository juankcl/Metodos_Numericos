function punto1 ()
clc;
close all;
clear all;
load Datos_1_1.txt
%modelo inicial
x= Datos_1_1(1,:);
y= Datos_1_1(2,:);
yq=3.882804172-5.148059216*x+.9694192664*(x.^2);
subplot(2,2,2)
plot(x,yq, 'm');
subplot(2,2,1)
plot(x,y);
%Regresión lineal minimos cuadrados
sumax=0;
sumay=0;
sumaxy=0;
sumaxx=0;
sumaxcub=0;
sumaxcuar=0;
sumaxyy=0;
sumaxquin=0;
sumaxsex=0;
sumaxycub=0;

for i=1:101
    sumax= sumax+Datos_1_1(1,i);
    sumay= sumay+Datos_1_1(2,i);
    sumaxx= sumaxx+ (Datos_1_1(1,i)^2);
    sumaxy= sumaxy + (Datos_1_1(1,i)* Datos_1_1(2,i));
    sumaxcub= sumaxcub + (Datos_1_1(1,i)^3);
    sumaxcuar= sumaxcuar + (Datos_1_1(1,i)^4);
    sumaxquin= sumaxquin + (Datos_1_1(1,i)^5);
    sumaxsex = sumaxsex + (Datos_1_1(1,i)^6);
    sumaxyy = sumaxyy + (Datos_1_1(1,i)*(Datos_1_1(2,i)^2));
    sumaxycub = sumaxycub + (Datos_1_1(1,i)*(Datos_1_1(2,i)^3));
end

sumax
sumay
sumaxy
sumaxx
sumaxcub
sumaxcuar
sumaxyy
sumaxquin
sumaxsex
sumaxycub

a1=((101*sumaxy)-(sumax*sumay))/((101*sumaxx)-((sumax)^2));
a0= mean(y)-(a1*mean(x));
x2=0:.09:5;
y2= a0+a1*x2;
subplot(2,2,2)
plot(x2,y2, 'ro')
%RRegresión segmentada
%Regresion cuadrada
A = [101 sumax sumaxx; sumax sumaxx sumaxcub; sumaxx sumaxcub sumaxcuar];
B= [sumay; sumaxy; sumaxyy];
C= A\B;
ycuad= C(1,1)+C(2,1)*x2+C(3,1)*(x2.^2);
subplot(2,2,3)
plot(x2,ycuad)
%Regresion Cubica
A2 = [101 sumax sumaxx sumaxcub; sumax sumaxx sumaxcub sumaxcuar; sumaxx sumaxcub sumaxcuar sumaxquin; sumaxcub sumaxcuar sumaxquin sumaxsex];
B2= [sumay; sumaxy; sumaxyy; sumaxycub];
C2= A2\B2;
ycub = C2(1,1)+C2(2,1)*x2+C2(3,1)*(x2.^2)+ (C2(4,1)*x2.^3);
subplot(2,2,4);
plot(x2,ycub);

%plot(x2,ycub,'r-',x2,ycuad,'b*', x, y, 'g-', x2,y2 , 'og');
%plot(x, y, 'g-',x2,ycub,'r--',x2,ycuad,'b*', x2,y2 , 'm+');