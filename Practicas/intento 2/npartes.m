function npartes()
n=2;
Ne=101;
gdo=2;
matrix=zeros(gdo+1,gdo+1);
d=load('Datos_1_1.txt');
x= d(1,:);
y= d(2,:);
entero=floor(Ne/n);
j=1;
for i=1:n-1
    xvector=x(1,j:i*entero);%hasta el segmento hacia abajo
    yvector=y(1,j:i*entero);
    [matrix]=regresion(xvector,yvector,entero,gdo,matrix,i);
    v_renglon=matrix(i,:);
    evaluaciones=v_renglon'*(xvector.^gdo);
    hold on
    plot(xvector,evaluaciones);
    j=i*entero+1;
    
end
xvector=x(1,j:Ne);
yvector=x(1,j:Ne);
[matrix]=regresion(xvector,yvector,entero,gdo,matrix,i);
v_renglon=matrix(i,:);
evaluaciones=v_renglon'*(xvector.^gdo);
hold on
plot(xvector,evaluaciones);
    
