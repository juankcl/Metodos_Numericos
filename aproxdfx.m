function [fxprima]= aproxdfx(dx, x)
%{
UNIVERSIDAD DE GUANAJUATO
Juan Carlos Carrasco López
Función para calcular la evaluacion de la derivada de f(X) con x dada
%}
sum
xnew=x+dx;
fxcondx= funcion(xnew);
fx= funcion(x);
fxprima=(fxcondx-fx)/dx;