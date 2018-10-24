function [resp] =secante(fx,xt,dx, nit_max)
%{
UNIVERSIDAD DE GUANAJUATO
Juan Carlos Carrasco López
Programa para calcular la raiz de un polinomio mediante el metodo de la secante
%}
formatSpec = 'n\t\txt\t\txnew\t\tfx\t\t\tfxnew\t\t\txraiz\t\t\n';
fprintf(formatSpec);
%aproximacion%
n=0;
while((n<nit_max))
xnew=xt-dx;
demo=evalp(fx,xnew);
fxt= evalp(fx,xt);
%fxcondx=(demo-fxt)/(xnew-xt)
%---%
resp=xt-(((xt-xnew)*fxt)/(fxt-demo));
formatSpec = '%d\t%f\t%f\t%f\t%f\t%f\n\n';
fprintf(formatSpec,n,xt, xnew, fxt,demo,resp);
xt=resp;
n=n+1;
end


