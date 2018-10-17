function [fxprima]= aproximacion_derivada_fx(dx, x)
xnew=x+dx;
fxcondx= funcion(xnew);
fx= funcion(x);
fxprima=(fxcondx-fx)/dx;