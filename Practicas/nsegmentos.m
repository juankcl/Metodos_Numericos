function nsegmentos()
load Datos_1_1.txt
x= Datos_1_1(1,:);
y= Datos_1_1(2,:);
%Segmentos Lineales
xl_1= Datos_1_1(1,1:11);
yl_1= Datos_1_1(2,1:11);
xl_2= Datos_1_1(1,11:41);
yl_2= Datos_1_1(2,11:41);
xl_3= Datos_1_1(1,41:71);
yl_3= Datos_1_1(2,41:71);
xl_4= Datos_1_1(1,71:91);
yl_4= Datos_1_1(2,71:91);
xl_5= Datos_1_1(1,91:101);
yl_5= Datos_1_1(2,91:101);
%Segmentos cuadráticos y cúbicos
xc_1=Datos_1_1(1,1:41);
yc_1=Datos_1_1(2,1:41);
xc_2=Datos_1_1(1,41:71);
yc_2=Datos_1_1(2,41:71);
xc_3=Datos_1_1(1,72:101);
yc_3=Datos_1_1(2,72:101);
%Evaular modelos lineales
    
    %Parámetros
    eval=xc_2;
    eval2=yc_2;
    %evaluaciones de sumatorias de parametros
    
    n=length(eval);
    sumax=sum(eval);
    sumaxx=sum(eval.^2);
    sumaxcub=sum(eval.^3);
    sumaxcuar=sum(eval.^4);
    sumaxquin=sum(eval.^5);
    sumaxsex=sum(eval.^6);
    sumay=sum(eval2);
    sumaxy=sum(eval.*eval2);
    sumaxxy=sum((eval.^2).*(eval2));
    sumaxcuby=sum((eval.^3).*(eval2));
    
    %{
    %Lineas
    a1=((n*sumaxy)-(sumax*sumay))/((n*sumaxx)-(sumax^2))
    a0=mean(eval2)-(a1*mean(eval))
    func=a0+(a1*eval);
    plot(eval,func);
    %}
    %Cuadrados
    A=[n sumax sumaxx; sumax sumaxx sumaxcub; sumaxx sumaxcub sumaxcuar];
    B=[sumay;sumaxy;sumaxxy];
    C=A\B
    ycuad = C(1,1)+C(2,1)*eval+C(3,1)*(eval.^2);
    plot(eval,ycuad);
    
   %{
    %Cubicos
    A2=[n sumax sumaxx sumaxcub; sumax sumaxx sumaxcub sumaxcuar; sumaxx sumaxcub sumaxcuar sumaxquin; sumaxcub sumaxcuar sumaxquin sumaxsex];
    B2=[sumay;sumaxy;sumaxxy;sumaxcuby];
    C2=A2\B2
    ycub = C2(1,1)+C2(2,1)*eval+C2(3,1)*(eval.^2)+C2(4,1)*(eval.^3);
    plot(eval,ycub)
    %}
    
ygl_1=2.237+1.802*xl_1;
ygl_2=6.125-6.0156*xl_2;
ygl_3=-11.6336+3.157*xl_3;
ygl_4=-4.4618+.9393*xl_4;
ygl_5=-17.4382+3.8904*xl_5;

ygc_1=2.905+.1912*xc_1-2.332*xc_1.^2;
ygc_2=-13.401+4.463*xc_2-.235*xc_2.^2;
ygc_3=29.405-16.017*xc_3+2.111*xc_3.^2;

ygcu_1=1.7854+7.357*xc_1-11.402*xc_1.^2+3.023*xc_1.^3;
ygcu_2=45.025-60.625*xc_2+23.566*xc_2.^2-2.859*xc_2.^3;
ygcu_3=37.059-21.455*xc_3+3.391*xc_3.^2-.0998*xc_3.^3;

figure(1)
plot(xl_1,ygl_1,'-+',xl_2,ygl_2,'-+',xl_3,ygl_3,'-+',xl_4,ygl_4,'-+',xl_5,ygl_5,'-+',x,y,'k');
figure(2)
plot(xc_1,ygc_1,'-+',xc_2,ygc_2,'-+',xc_3,ygc_3,'-+',x,y,'k');
figure(3)
plot(xc_1,ygcu_1,'-+',xc_2,ygcu_2,'-+',xc_3,ygcu_3,'-+',x,y,'k');



    