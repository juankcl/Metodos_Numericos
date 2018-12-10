function punto2 ()
load Datos_1_1.txt

x= Datos_1_1(1,:);
y= Datos_1_1(2,:);

n=101;
sumax=sum(x)
sumaxx=sum(x.^2)
sumaxcub=sum(x.^3)
sumaxcuar=sum(x.^4)
sumaxquin=sum(x.^5)
sumaxsex=sum(x.^6)
sumay=sum(y)
sumaxy=sum(x.*y)
sumaxxy=sum((x.^2).*(y))
sumaxcuby=sum((x.^3).*(y))

%Regresión Lineal
a1=((n*sumaxy)-(sumax*sumay))/((n*sumaxx)-(sumax^2));
a0=mean(y)+(a1*mean(x));
func=a0-(a1*x);
plot(x,func)
%Regresión Cuadrada
A=[n sumax sumaxx; sumax sumaxx sumaxcub; sumaxx sumaxcub sumaxcuar];
B=[sumay;sumaxy;sumaxxy];
C=A\B;
xaux = 0:0.09:5;
ycuad = C(1,1)+C(2,1)*xaux+C(3,1)*(xaux.^2)
plot(xaux,ycuad)
%Regresión Cúbica
A2=[n sumax sumaxx sumaxcub; sumax sumaxx sumaxcub sumaxcuar; sumaxx sumaxcub sumaxcuar sumaxquin; sumaxcub sumaxcuar sumaxquin sumaxsex];
B2=[sumay;sumaxy;sumaxxy;sumaxcuby];
C2=A2\B2;
xaux = 0:0.09:5;
ycub = C2(1,1)+C2(2,1)*xaux+C2(3,1)*(xaux.^2)+C2(4,1)*(xaux.^3);
%plot(xaux,ycub)

plot(xaux,ycub,'m',xaux,ycuad,'r',x,func,'g',x,y,'b');
title('Graficas de modelos');
xlabel({'magenta: modelo cubico','rojo:modelo cuadrado','Verde:modelo lineaal','Azul: datos originales'})
