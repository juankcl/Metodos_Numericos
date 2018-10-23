function [fxprima]= aproxdfx(dx, x)
xnew=x+dx;
fxcondx= funcion(xnew);
fx= funcion(x);
fxprima=(fxcondx-fx)/dx;